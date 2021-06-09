# vim:ft=terraform

locals {
  rclc_team = [
    "JanStatschulat",
  ]
  rclc_repositories = [
    "rclc-release",
  ]
}

resource "github_membership" "rclc_team" {
  for_each = toset(local.rclc_team)
  username = each.value
  role = "member"
}

resource "github_team" "rclc_team" {
  name = "rclc"
  description = "ROS release managers for the rclc project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "rclc_team" {
  for_each = toset(local.rclc_team)
  team_id = github_team.rclc_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "rclc_repositories" {
  for_each = toset(local.rclc_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "rclc_team" {
  for_each = toset(local.rclc_repositories)
  team_id = github_team.rclc_team.id
  repository = each.value
  permission = "maintain"
}
