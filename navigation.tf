# vim:ft=terraform

locals {
  navigation_team = [
    "JWhitleyWork",
    "SteveMacenski",
  ]
  navigation_repositories = [
    "image_pipeline-release",
    "navigation2-release",
  ]
}

resource "github_membership" "navigation_team" {
  for_each = toset(local.navigation_team)
  username = each.value
  role = "member"
}

resource "github_team" "navigation_team" {
  name = "navigation"
  description = "ROS release managers for the navigation project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "navigation_team" {
  for_each = toset(local.navigation_team)
  team_id = github_team.navigation_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "navigation_repositories" {
  for_each = toset(local.navigation_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "navigation_team" {
  for_each = toset(local.navigation_repositories)
  team_id = github_team.navigation_team.id
  repository = each.value
  permission = "maintain"
}
