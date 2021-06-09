# vim:ft=terraform

locals {
  robotwebtools_team = [
    "nuclearsandwich",
    "dirk-thomas",
  ]
  robotwebtools_repositories = [
    "rosbridge_suite-release",
    "web_video_server-release",
  ]
}

resource "github_membership" "robotwebtools_team" {
  for_each = toset(local.robotwebtools_team)
  username = each.value
  role = "member"
}

resource "github_team" "robotwebtools_team" {
  name = "robotwebtools"
  description = "ROS release managers for the robotwebtools project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "robotwebtools_team" {
  for_each = toset(local.robotwebtools_team)
  team_id = github_team.robotwebtools_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "robotwebtools_repositories" {
  for_each = toset(local.robotwebtools_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "robotwebtools_team" {
  for_each = toset(local.robotwebtools_repositories)
  team_id = github_team.robotwebtools_team.id
  repository = each.value
  permission = "maintain"
}
