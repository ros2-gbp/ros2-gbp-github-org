# vim:ft=terraform

locals {
  nmea_team = [
    "evenator",
  ]
  nmea_repositories = [
    "nmea_msgs-release",
    "nmea_navsat_driver-release",
  ]
}

resource "github_membership" "nmea_team" {
  for_each = toset(local.nmea_team)
  username = each.value
  role = "member"
}

resource "github_team" "nmea_team" {
  name = "nmea"
  description = "ROS release managers for the nmea project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "nmea_team" {
  for_each = toset(local.nmea_team)
  team_id = github_team.nmea_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "nmea_repositories" {
  for_each = toset(local.nmea_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "nmea_team" {
  for_each = toset(local.nmea_repositories)
  team_id = github_team.nmea_team.id
  repository = each.value
  permission = "maintain"
}
