# vim:ft=terraform

locals {
  lgsvl_team = [
    "hadiTab",
    "daviduhm",
    "zelenovsky",
  ]
  lgsvl_repositories = [
    "lgsvl_msgs-release",
  ]
}

resource "github_membership" "lgsvl_team" {
  for_each = toset(local.lgsvl_team)
  username = each.value
  role = "member"
}

resource "github_team" "lgsvl_team" {
  name = "lgsvl"
  description = "ROS release managers for the lgsvl project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "lgsvl_team" {
  for_each = toset(local.lgsvl_team)
  team_id = github_team.lgsvl_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "lgsvl_repositories" {
  for_each = toset(local.lgsvl_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "lgsvl_team" {
  for_each = toset(local.lgsvl_repositories)
  team_id = github_team.lgsvl_team.id
  repository = each.value
  permission = "maintain"
}
