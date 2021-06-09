# vim:ft=terraform

locals {
  ublox_team = [
    "Timple",
  ]
  ublox_repositories = [
    "ublox-release",
  ]
}

resource "github_membership" "ublox_team" {
  for_each = toset(local.ublox_team)
  username = each.value
  role = "member"
}

resource "github_team" "ublox_team" {
  name = "ublox"
  description = "ROS release managers for the ublox project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "ublox_team" {
  for_each = toset(local.ublox_team)
  team_id = github_team.ublox_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "ublox_repositories" {
  for_each = toset(local.ublox_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "ublox_team" {
  for_each = toset(local.ublox_repositories)
  team_id = github_team.ublox_team.id
  repository = each.value
  permission = "maintain"
}
