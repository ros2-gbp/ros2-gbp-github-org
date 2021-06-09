# vim:ft=terraform

locals {
  system_modes_team = [
    "norro",
  ]
  system_modes_repositories = [
    "system_modes-release",
  ]
}

resource "github_membership" "system_modes_team" {
  for_each = toset(local.system_modes_team)
  username = each.value
  role = "member"
}

resource "github_team" "system_modes_team" {
  name = "system_modes"
  description = "ROS release managers for the system_modes project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "system_modes_team" {
  for_each = toset(local.system_modes_team)
  team_id = github_team.system_modes_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "system_modes_repositories" {
  for_each = toset(local.system_modes_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "system_modes_team" {
  for_each = toset(local.system_modes_repositories)
  team_id = github_team.system_modes_team.id
  repository = each.value
  permission = "maintain"
}
