# vim:ft=terraform

locals {
  ouster_drivers_team = [
    "SteveMacenski",
  ]
  ouster_drivers_repositories = [
    "ros2_ouster_drivers-release",
  ]
}

resource "github_membership" "ouster_drivers_team" {
  for_each = toset(local.ouster_drivers_team)
  username = each.value
  role = "member"
}

resource "github_team" "ouster_drivers_team" {
  name = "ouster_drivers"
  description = "ROS release managers for the ouster_drivers project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "ouster_drivers_team" {
  for_each = toset(local.ouster_drivers_team)
  team_id = github_team.ouster_drivers_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "ouster_drivers_repositories" {
  for_each = toset(local.ouster_drivers_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "ouster_drivers_team" {
  for_each = toset(local.ouster_drivers_repositories)
  team_id = github_team.ouster_drivers_team.id
  repository = each.value
  permission = "maintain"
}
