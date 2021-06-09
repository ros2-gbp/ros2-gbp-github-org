# vim:ft=terraform

locals {
  mrpt2_team = [
    "jlblancoc",
    "jolting",
  ]
  mrpt2_repositories = [
    "mrpt2-release",
  ]
}

resource "github_membership" "mrpt2_team" {
  for_each = toset(local.mrpt2_team)
  username = each.value
  role = "member"
}

resource "github_team" "mrpt2_team" {
  name = "mrpt2"
  description = "ROS release managers for the mrpt2 project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "mrpt2_team" {
  for_each = toset(local.mrpt2_team)
  team_id = github_team.mrpt2_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "mrpt2_repositories" {
  for_each = toset(local.mrpt2_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "mrpt2_team" {
  for_each = toset(local.mrpt2_repositories)
  team_id = github_team.mrpt2_team.id
  repository = each.value
  permission = "maintain"
}
