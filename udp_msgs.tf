# vim:ft=terraform

locals {
  udp_msgs_team = [
    "flynneva",
  ]
  udp_msgs_repositories = [
    "udp_msgs-release",
  ]
}

resource "github_membership" "udp_msgs_team" {
  for_each = toset(local.udp_msgs_team)
  username = each.value
  role = "member"
}

resource "github_team" "udp_msgs_team" {
  name = "udp_msgs"
  description = "ROS release managers for the udp_msgs project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "udp_msgs_team" {
  for_each = toset(local.udp_msgs_team)
  team_id = github_team.udp_msgs_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "udp_msgs_repositories" {
  for_each = toset(local.udp_msgs_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "udp_msgs_team" {
  for_each = toset(local.udp_msgs_repositories)
  team_id = github_team.udp_msgs_team.id
  repository = each.value
  permission = "maintain"
}
