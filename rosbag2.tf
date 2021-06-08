locals {
  rosbag2_team = [
    "Karsten1987",
    "emersonknapp",
  ]

  rosbag2_repositories = [
    "rosbag2-release",
    "rosbag2_bag_v2-release",
  ]
}

resource "github_membership" "rosbag2_team" {
  for_each = toset(local.rosbag2_team)
  username = each.value
  role = "member"
}

resource "github_team" "rosbag2_team" {
  name = "rosbag2"
  description = "ROS release managers for rosbag2"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "rosbag2_team" {
  for_each = toset(local.rosbag2_team)
  team_id = github_team.rosbag2_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "rosbag2_repositories" {
  for_each = toset(local.rosbag2_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "rosbag2_team" {
  for_each = toset(local.rosbag2_repositories)
  team_id = github_team.rosbag2_team.id
  repository = each.value
  permission = "maintain"
}
