locals {
  autoware_team = [
    "esteve",
    "JWhitleyWork",
  ]

  autoware_repositories = [
    "acado_vendor-release",
    "autoware_auto_msgs-release",
    "ros2_socketcan-release",
  ]
}

resource "github_membership" "autoware_team" {
    for_each = toset(local.autoware_team)
    username = each.value
    role = "member"
}

resource "github_team" "autoware_team" {
  name = "autoware"
  description = "ROS release managers for the Autoware project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "autoware_team" {
  for_each = toset(local.autoware_team)
  team_id = github_team.autoware_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "autoware_repositories" {
  for_each = toset(local.autoware_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "autoware_team" {
  for_each = toset(local.autoware_repositories)
  team_id = github_team.autoware_team.id
  repository = each.value
  permission = "maintain"
}
