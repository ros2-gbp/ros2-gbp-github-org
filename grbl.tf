# vim:ft=terraform

locals {
  grbl_team = [
    "flynneva",
  ]
  grbl_repositories = [
    "grbl_msgs-release",
    "grbl_ros-release",
  ]
}

resource "github_membership" "grbl_team" {
  for_each = toset(local.grbl_team)
  username = each.value
  role = "member"
}

resource "github_team" "grbl_team" {
  name = "grbl"
  description = "ROS release managers for the grbl project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "grbl_team" {
  for_each = toset(local.grbl_team)
  team_id = github_team.grbl_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "grbl_repositories" {
  for_each = toset(local.grbl_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "grbl_team" {
  for_each = toset(local.grbl_repositories)
  team_id = github_team.grbl_team.id
  repository = each.value
  permission = "maintain"
}
