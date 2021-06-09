# vim:ft=terraform

locals {
  perception_team = [
    "jonbinney",
  ]
  perception_repositories = [
    "laser_geometry-release",
  ]
}

resource "github_membership" "perception_team" {
  for_each = toset(local.perception_team)
  username = each.value
  role = "member"
}

resource "github_team" "perception_team" {
  name = "perception"
  description = "ROS release managers for the perception project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "perception_team" {
  for_each = toset(local.perception_team)
  team_id = github_team.perception_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "perception_repositories" {
  for_each = toset(local.perception_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "perception_team" {
  for_each = toset(local.perception_repositories)
  team_id = github_team.perception_team.id
  repository = each.value
  permission = "maintain"
}
