# vim:ft=terraform

locals {
  connextdds_team = [
    "asorbini",
  ]
  connextdds_repositories = [
    "rmw_connextdds-release",
  ]
}

resource "github_membership" "connextdds_team" {
  for_each = toset(local.connextdds_team)
  username = each.value
  role = "member"
}

resource "github_team" "connextdds_team" {
  name = "connextdds"
  description = "ROS release managers for the connextdds project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "connextdds_team" {
  for_each = toset(local.connextdds_team)
  team_id = github_team.connextdds_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "connextdds_repositories" {
  for_each = toset(local.connextdds_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "connextdds_team" {
  for_each = toset(local.connextdds_repositories)
  team_id = github_team.connextdds_team.id
  repository = each.value
  permission = "maintain"
}
