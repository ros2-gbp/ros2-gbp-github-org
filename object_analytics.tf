# vim:ft=terraform

locals {
  object_analytics_team = [
    "yechun1",
  ]
  object_analytics_repositories = [
    "ros2_object_analytics-release",
    "ros2_object_msgs-release",
  ]
}

resource "github_membership" "object_analytics_team" {
  for_each = toset(local.object_analytics_team)
  username = each.value
  role = "member"
}

resource "github_team" "object_analytics_team" {
  name = "object_analytics.tf"
  description = "ROS release managers for the object_analytics.tf project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "object_analytics_team" {
  for_each = toset(local.object_analytics_team)
  team_id = github_team.object_analytics_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "object_analytics_repositories" {
  for_each = toset(local.object_analytics_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "object_analytics_team" {
  for_each = toset(local.object_analytics_repositories)
  team_id = github_team.object_analytics_team.id
  repository = each.value
  permission = "maintain"
}
