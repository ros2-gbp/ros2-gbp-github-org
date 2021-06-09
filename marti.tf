# vim:ft=terraform

locals {
  marti_team = [
    "evenator",
    "pjreed",
  ]
  marti_repositories = [
    "marti_common-release",
    "marti_messages-release",
  ]
}

resource "github_membership" "marti_team" {
  for_each = toset(local.marti_team)
  username = each.value
  role = "member"
}

resource "github_team" "marti_team" {
  name = "marti"
  description = "ROS release managers for the marti project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "marti_team" {
  for_each = toset(local.marti_team)
  team_id = github_team.marti_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "marti_repositories" {
  for_each = toset(local.marti_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "marti_team" {
  for_each = toset(local.marti_repositories)
  team_id = github_team.marti_team.id
  repository = each.value
  permission = "maintain"
}
