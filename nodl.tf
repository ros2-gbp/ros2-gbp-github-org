# vim:ft=terraform

locals {
  nodl_team = [
    "Arnatious",
  ]
  nodl_repositories = [
    "ament_nodl-release",
    "nodl-release",
  ]
}

resource "github_membership" "nodl_team" {
  for_each = toset(local.nodl_team)
  username = each.value
  role = "member"
}

resource "github_team" "nodl_team" {
  name = "nodl"
  description = "ROS release managers for the nodl project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "nodl_team" {
  for_each = toset(local.nodl_team)
  team_id = github_team.nodl_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "nodl_repositories" {
  for_each = toset(local.nodl_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "nodl_team" {
  for_each = toset(local.nodl_repositories)
  team_id = github_team.nodl_team.id
  repository = each.value
  permission = "maintain"
}
