# vim:ft=terraform

locals {
  geographic_info_team = [
    "SteveMacenski",
  ]
  geographic_info_repositories = [
    "geographic_info-release",
  ]
}

resource "github_membership" "geographic_info_team" {
  for_each = toset(local.geographic_info_team)
  username = each.value
  role = "member"
}

resource "github_team" "geographic_info_team" {
  name = "geographic_info"
  description = "ROS release managers for the geographic_info project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "geographic_info_team" {
  for_each = toset(local.geographic_info_team)
  team_id = github_team.geographic_info_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "geographic_info_repositories" {
  for_each = toset(local.geographic_info_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "geographic_info_team" {
  for_each = toset(local.geographic_info_repositories)
  team_id = github_team.geographic_info_team.id
  repository = each.value
  permission = "maintain"
}
