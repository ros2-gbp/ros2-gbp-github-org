# vim:ft=terraform

locals {
  diagnostics_team = [
    "Karsten1987",
  ]
  diagnostics_repositories = [
    "diagnostics-release",
  ]
}

resource "github_membership" "diagnostics_team" {
  for_each = toset(local.diagnostics_team)
  username = each.value
  role = "member"
}

resource "github_team" "diagnostics_team" {
  name = "diagnostics"
  description = "ROS release managers for the diagnostics project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "diagnostics_team" {
  for_each = toset(local.diagnostics_team)
  team_id = github_team.diagnostics_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "diagnostics_repositories" {
  for_each = toset(local.diagnostics_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "diagnostics_team" {
  for_each = toset(local.diagnostics_repositories)
  team_id = github_team.diagnostics_team.id
  repository = each.value
  permission = "maintain"
}
