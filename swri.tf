# vim:ft=terraform

locals {
  swri_team = [
    "daniel-dsouza",
    "danthony06",
  ]
  swri_repositories = [
    "gps_umd-release",
    "mapviz-release",
    "marti_common-release",
    "marti_messages-release",
    "swri_console-release",
  ]
}

resource "github_membership" "swri_team" {
  for_each = toset(local.swri_team)
  username = each.value
  role = "member"
}

resource "github_team" "swri_team" {
  name = "marti"
  description = "ROS release managers for the marti project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "swri_team" {
  for_each = toset(local.swri_team)
  team_id = github_team.swri_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "swri_repositories" {
  for_each = toset(local.swri_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "swri_team" {
  for_each = toset(local.swri_repositories)
  team_id = github_team.swri_team.id
  repository = each.value
  permission = "maintain"
}
