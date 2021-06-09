# vim:ft=terraform

locals {
  message_filters_team = [
    "gaoethan",
    "yechun1",
  ]
  message_filters_repositories = [
    "ros2_message_filters-release",
  ]
}

resource "github_membership" "message_filters_team" {
  for_each = toset(local.message_filters_team)
  username = each.value
  role = "member"
}

resource "github_team" "message_filters_team" {
  name = "message_filters"
  description = "ROS release managers for the message_filters project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "message_filters_team" {
  for_each = toset(local.message_filters_team)
  team_id = github_team.message_filters_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "message_filters_repositories" {
  for_each = toset(local.message_filters_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "message_filters_team" {
  for_each = toset(local.message_filters_repositories)
  team_id = github_team.message_filters_team.id
  repository = each.value
  permission = "maintain"
}
