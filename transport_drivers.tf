# vim:ft=terraform

locals {
  transport_drivers_team = [
    "JWhitleyWork",
  ]
  transport_drivers_repositories = [
    "transport_drivers-release",
  ]
}

resource "github_membership" "transport_drivers_team" {
  for_each = toset(local.transport_drivers_team)
  username = each.value
  role = "member"
}

resource "github_team" "transport_drivers_team" {
  name = "transport_drivers"
  description = "ROS release managers for the transport_drivers project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "transport_drivers_team" {
  for_each = toset(local.transport_drivers_team)
  team_id = github_team.transport_drivers_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "transport_drivers_repositories" {
  for_each = toset(local.transport_drivers_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "transport_drivers_team" {
  for_each = toset(local.transport_drivers_repositories)
  team_id = github_team.transport_drivers_team.id
  repository = each.value
  permission = "maintain"
}
