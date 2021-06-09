# vim:ft=terraform

locals {
  octomap_team = [
    "wxmerkt",
  ]
  octomap_repositories = [
    "octomap_msgs-release",
  ]
}

resource "github_membership" "octomap_team" {
  for_each = toset(local.octomap_team)
  username = each.value
  role = "member"
}

resource "github_team" "octomap_team" {
  name = "octomap"
  description = "ROS release managers for the octomap project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "octomap_team" {
  for_each = toset(local.octomap_team)
  team_id = github_team.octomap_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "octomap_repositories" {
  for_each = toset(local.octomap_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "octomap_team" {
  for_each = toset(local.octomap_repositories)
  team_id = github_team.octomap_team.id
  repository = each.value
  permission = "maintain"
}
