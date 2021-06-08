# vim:ft=terraform

locals {
  apriltag_team = [
    "mkrogius",
    "wxmerkt",
  ]
  apriltag_repositories = [
    "apriltag-release",
  ]
}

resource "github_membership" "apriltag_team" {
  for_each = toset(local.apriltag_team)
  username = each.value
  role = "member"
}

resource "github_team" "apriltag_team" {
  name = "apriltag"
  description = "ROS release managers for the apriltag project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "apriltag_team" {
  for_each = toset(local.apriltag_team)
  team_id = github_team.apriltag_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "apriltag_repositories" {
  for_each = toset(local.apriltag_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "apriltag_team" {
  for_each = toset(local.apriltag_repositories)
  team_id = github_team.apriltag_team.id
  repository = each.value
  permission = "maintain"
}
