# vim:ft=terraform

locals {
  tracing_team = [
    "christophbedard",
    "iluetkeb",
  ]
  tracing_repositories = [
    "ros2_tracing-release",
    "tracetools_analysis-release",
  ]
}

resource "github_membership" "tracing_team" {
  for_each = toset(local.tracing_team)
  username = each.value
  role = "member"
}

resource "github_team" "tracing_team" {
  name = "tracing"
  description = "ROS release managers for the tracing project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "tracing_team" {
  for_each = toset(local.tracing_team)
  team_id = github_team.tracing_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "tracing_repositories" {
  for_each = toset(local.tracing_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "tracing_team" {
  for_each = toset(local.tracing_repositories)
  team_id = github_team.tracing_team.id
  repository = each.value
  permission = "maintain"
}
