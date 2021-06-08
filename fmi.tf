# vim:ft=terraform

locals {
  fmi_team = [
    "ralph-lange",
  ]
  fmi_repositories = [
    "fmi_adapter-release",
    "fmilibrary_vendor-release",
  ]
}

resource "github_membership" "fmi_team" {
  for_each = toset(local.fmi_team)
  username = each.value
  role = "member"
}

resource "github_team" "fmi_team" {
  name = "fmi"
  description = "ROS release managers for the fmi project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "fmi_team" {
  for_each = toset(local.fmi_team)
  team_id = github_team.fmi_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "fmi_repositories" {
  for_each = toset(local.fmi_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "fmi_team" {
  for_each = toset(local.fmi_repositories)
  team_id = github_team.fmi_team.id
  repository = each.value
  permission = "maintain"
}
