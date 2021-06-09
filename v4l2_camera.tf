# vim:ft=terraform

locals {
  v4l2_camera_team = [
    "sgvandijk",
  ]
  v4l2_camera_repositories = [
    "ros2_v4l2_camera-release",
  ]
}

resource "github_membership" "v4l2_camera_team" {
  for_each = toset(local.v4l2_camera_team)
  username = each.value
  role = "member"
}

resource "github_team" "v4l2_camera_team" {
  name = "v4l2_camera"
  description = "ROS release managers for the v4l2_camera project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "v4l2_camera_team" {
  for_each = toset(local.v4l2_camera_team)
  team_id = github_team.v4l2_camera_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "v4l2_camera_repositories" {
  for_each = toset(local.v4l2_camera_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "v4l2_camera_team" {
  for_each = toset(local.v4l2_camera_repositories)
  team_id = github_team.v4l2_camera_team.id
  repository = each.value
  permission = "maintain"
}
