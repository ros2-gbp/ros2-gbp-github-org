# vim:ft=terraform

locals {
  apex_team = [
    "carlossvg",
  ]
  apex_repositories = [
    "apex_containers-release",
    "apex_test_tools-release",
  ]
}

resource "github_membership" "apex_team" {
  for_each = toset(local.apex_team)
  username = each.value
  role = "member"
}

resource "github_team" "apex_team" {
  name = "apex"
  description = "ROS release managers for the apex project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "apex_team" {
  for_each = toset(local.apex_team)
  team_id = github_team.apex_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "apex_repositories" {
  for_each = toset(local.apex_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "apex_team" {
  for_each = toset(local.apex_repositories)
  team_id = github_team.apex_team.id
  repository = each.value
  permission = "maintain"
}
