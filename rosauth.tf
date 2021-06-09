# vim:ft=terraform

locals {
  rosauth_team = [
    "reinzor",
  ]
  rosauth_repositories = [
    "rosauth-release",
  ]
}

resource "github_membership" "rosauth_team" {
  for_each = toset(local.rosauth_team)
  username = each.value
  role = "member"
}

resource "github_team" "rosauth_team" {
  name = "rosauth"
  description = "ROS release managers for the rosauth project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "rosauth_team" {
  for_each = toset(local.rosauth_team)
  team_id = github_team.rosauth_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "rosauth_repositories" {
  for_each = toset(local.rosauth_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "rosauth_team" {
  for_each = toset(local.rosauth_repositories)
  team_id = github_team.rosauth_team.id
  repository = each.value
  permission = "maintain"
}
