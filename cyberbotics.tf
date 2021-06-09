# vim:ft=terraform

locals {
  cyberbotics_team = [
    "lukicdarkoo",
  ]
  cyberbotics_repositories = [
    "webots_ros2-release",
  ]
}

resource "github_membership" "cyberbotics_team" {
  for_each = toset(local.cyberbotics_team)
  username = each.value
  role = "member"
}

resource "github_team" "cyberbotics_team" {
  name = "cyberbotics"
  description = "ROS release managers for the cyberbotics project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "cyberbotics_team" {
  for_each = toset(local.cyberbotics_team)
  team_id = github_team.cyberbotics_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "cyberbotics_repositories" {
  for_each = toset(local.cyberbotics_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "cyberbotics_team" {
  for_each = toset(local.cyberbotics_repositories)
  team_id = github_team.cyberbotics_team.id
  repository = each.value
  permission = "maintain"
}
