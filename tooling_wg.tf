# vim:ft=terraform

locals {
  tooling_wg_team = [
    "emersonknapp",
    "thomas-moulard",
  ]
  tooling_wg_repositories = [
    "libstatistics_collector-release",
  ]
}

resource "github_membership" "tooling_wg_team" {
  for_each = toset(local.tooling_wg_team)
  username = each.value
  role = "member"
}

resource "github_team" "tooling_wg_team" {
  name = "tooling_wg"
  description = "ROS release managers for the tooling_wg project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "tooling_wg_team" {
  for_each = toset(local.tooling_wg_team)
  team_id = github_team.tooling_wg_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "tooling_wg_repositories" {
  for_each = toset(local.tooling_wg_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "tooling_wg_team" {
  for_each = toset(local.tooling_wg_repositories)
  team_id = github_team.tooling_wg_team.id
  repository = each.value
  permission = "maintain"
}
