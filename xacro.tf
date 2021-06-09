# vim:ft=terraform

locals {
  xacro_team = [
    "codebot",
    "rhaschke",
  ]
  xacro_repositories = [
    "xacro-release",
  ]
}

resource "github_membership" "xacro_team" {
  for_each = toset(local.xacro_team)
  username = each.value
  role = "member"
}

resource "github_team" "xacro_team" {
  name = "xacro"
  description = "ROS release managers for the xacro project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "xacro_team" {
  for_each = toset(local.xacro_team)
  team_id = github_team.xacro_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "xacro_repositories" {
  for_each = toset(local.xacro_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "xacro_team" {
  for_each = toset(local.xacro_repositories)
  team_id = github_team.xacro_team.id
  repository = each.value
  permission = "maintain"
}
