# vim:ft=terraform

locals {
  roboception_team = [
    "flixr",
  ]
  roboception_repositories = [
    "rc_common_msgs_ros2-release",
    "rc_dynamics_api-release",
    "rc_genicam_api-release",
    "rc_genicam_driver_ros2-release",
  ]
}

resource "github_membership" "roboception_team" {
  for_each = toset(local.roboception_team)
  username = each.value
  role = "member"
}

resource "github_team" "roboception_team" {
  name = "roboception"
  description = "ROS release managers for the roboception project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "roboception_team" {
  for_each = toset(local.roboception_team)
  team_id = github_team.roboception_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "roboception_repositories" {
  for_each = toset(local.roboception_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "roboception_team" {
  for_each = toset(local.roboception_repositories)
  team_id = github_team.roboception_team.id
  repository = each.value
  permission = "maintain"
}
