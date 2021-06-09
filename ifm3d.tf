# vim:ft=terraform

locals {
  ifm3d_team = [
    "theseankelly",
  ]
  ifm3d_repositories = [
    "ifm3d-release",
  ]
}

resource "github_membership" "ifm3d_team" {
  for_each = toset(local.ifm3d_team)
  username = each.value
  role = "member"
}

resource "github_team" "ifm3d_team" {
  name = "ifm3d"
  description = "ROS release managers for the ifm3d project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "ifm3d_team" {
  for_each = toset(local.ifm3d_team)
  team_id = github_team.ifm3d_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "ifm3d_repositories" {
  for_each = toset(local.ifm3d_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "ifm3d_team" {
  for_each = toset(local.ifm3d_repositories)
  team_id = github_team.ifm3d_team.id
  repository = each.value
  permission = "maintain"
}
