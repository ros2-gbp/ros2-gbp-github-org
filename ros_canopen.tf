# vim:ft=terraform

locals {
  ros_canopen_team = [
    "ipa-mdl",
  ]
  ros_canopen_repositories = [
    "ros_canopen-release",
  ]
}

resource "github_membership" "ros_canopen_team" {
  for_each = toset(local.ros_canopen_team)
  username = each.value
  role = "member"
}

resource "github_team" "ros_canopen_team" {
  name = "ros_canopen"
  description = "ROS release managers for the ros_canopen project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "ros_canopen_team" {
  for_each = toset(local.ros_canopen_team)
  team_id = github_team.ros_canopen_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "ros_canopen_repositories" {
  for_each = toset(local.ros_canopen_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "ros_canopen_team" {
  for_each = toset(local.ros_canopen_repositories)
  team_id = github_team.ros_canopen_team.id
  repository = each.value
  permission = "maintain"
}
