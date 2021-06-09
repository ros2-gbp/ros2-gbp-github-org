# vim:ft=terraform

locals {
  control_team = [
    "Karsten1987",
    "bmagyar",
  ]
  control_repositories = [
    "ros2_control-release",
    "ros2_controllers-release",
  ]
}

resource "github_membership" "control_team" {
  for_each = toset(local.control_team)
  username = each.value
  role = "member"
}

resource "github_team" "control_team" {
  name = "control"
  description = "ROS release managers for the control project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "control_team" {
  for_each = toset(local.control_team)
  team_id = github_team.control_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "control_repositories" {
  for_each = toset(local.control_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "control_team" {
  for_each = toset(local.control_repositories)
  team_id = github_team.control_team.id
  repository = each.value
  permission = "maintain"
}
