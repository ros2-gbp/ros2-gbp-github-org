# vim:ft=terraform

locals {
  gazebo_team = [
    "ahcorde",
    "chapulina",
    "j-rivero",
  ]
  gazebo_repositories = [
    "gazebo_ros2_control-release",
    "gazebo_ros_pkgs-release",
    "ign_rviz-release",
    "ros_ign-release",
  ]
}

resource "github_membership" "gazebo_team" {
  for_each = toset(local.gazebo_team)
  username = each.value
  role = "member"
}

resource "github_team" "gazebo_team" {
  name = "gazebo"
  description = "ROS release managers for the gazebo project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "gazebo_team" {
  for_each = toset(local.gazebo_team)
  team_id = github_team.gazebo_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "gazebo_repositories" {
  for_each = toset(local.gazebo_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "gazebo_team" {
  for_each = toset(local.gazebo_repositories)
  team_id = github_team.gazebo_team.id
  repository = each.value
  permission = "maintain"
}
