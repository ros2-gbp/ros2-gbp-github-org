# vim:ft=terraform

locals {
  locator_ros_bridge_team = [
    "slaible",
  ]
  locator_ros_bridge_repositories = [
    "locator_ros_bridge-release",
  ]
}

resource "github_membership" "locator_ros_bridge_team" {
  for_each = toset(local.locator_ros_bridge_team)
  username = each.value
  role = "member"
}

resource "github_team" "locator_ros_bridge_team" {
  name = "locator_ros_bridge"
  description = "ROS release managers for the locator_ros_bridge project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "locator_ros_bridge_team" {
  for_each = toset(local.locator_ros_bridge_team)
  team_id = github_team.locator_ros_bridge_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "locator_ros_bridge_repositories" {
  for_each = toset(local.locator_ros_bridge_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "locator_ros_bridge_team" {
  for_each = toset(local.locator_ros_bridge_repositories)
  team_id = github_team.locator_ros_bridge_team.id
  repository = each.value
  permission = "maintain"
}
