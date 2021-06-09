# vim:ft=terraform

locals {
  urg_team = [
    "mikeferguson",
  ]
  urg_repositories = [
    "urg_c-release",
    "urg_node-release",
    "urg_node_msgs-release",
  ]
}

resource "github_membership" "urg_team" {
  for_each = toset(local.urg_team)
  username = each.value
  role = "member"
}

resource "github_team" "urg_team" {
  name = "urg"
  description = "ROS release managers for the urg project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "urg_team" {
  for_each = toset(local.urg_team)
  team_id = github_team.urg_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "urg_repositories" {
  for_each = toset(local.urg_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "urg_team" {
  for_each = toset(local.urg_repositories)
  team_id = github_team.urg_team.id
  repository = each.value
  permission = "maintain"
}
