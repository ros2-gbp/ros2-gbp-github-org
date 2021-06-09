# vim:ft=terraform

locals {
  realsense_team = [
    "RachelRen05",
    "doronhi",
    "sharonliu",
    "yechun1",
  ]
  realsense_repositories = [
    "librealsense-release",
    "ros2_intel_realsense-release",
  ]
}

resource "github_membership" "realsense_team" {
  for_each = toset(local.realsense_team)
  username = each.value
  role = "member"
}

resource "github_team" "realsense_team" {
  name = "realsense"
  description = "ROS release managers for the realsense project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "realsense_team" {
  for_each = toset(local.realsense_team)
  team_id = github_team.realsense_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "realsense_repositories" {
  for_each = toset(local.realsense_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "realsense_team" {
  for_each = toset(local.realsense_repositories)
  team_id = github_team.realsense_team.id
  repository = each.value
  permission = "maintain"
}
