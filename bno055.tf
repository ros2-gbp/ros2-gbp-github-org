# vim:ft=terraform

locals {
  bno055_team = [
    "flynneva",
  ]
  bno055_repositories = [
    "bno055-release",
  ]
}

resource "github_membership" "bno055_team" {
  for_each = toset(local.bno055_team)
  username = each.value
  role = "member"
}

resource "github_team" "bno055_team" {
  name = "bno055"
  description = "ROS release managers for the bno055 project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "bno055_team" {
  for_each = toset(local.bno055_team)
  team_id = github_team.bno055_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "bno055_repositories" {
  for_each = toset(local.bno055_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "bno055_team" {
  for_each = toset(local.bno055_repositories)
  team_id = github_team.bno055_team.id
  repository = each.value
  permission = "maintain"
}
