# vim:ft=terraform

locals {
  rmf_team = [
    "marcoag",
  ]
  rmf_repositories = [
    "ament_cmake_catch2-release",
    "menge_vendor-release",
    "rmf_battery-release",
    "rmf_building_map_msgs-release",
    "rmf_cmake_uncrustify-release",
    "rmf_demos-release",
    "rmf_internal_msgs-release",
    "rmf_ros2-release",
    "rmf_simulation-release",
    "rmf_task-release",
    "rmf_traffic-release",
    "rmf_traffic_editor-release",
    "rmf_utils-release",
    "rmf_visualization-release",
    "rmf_visualization_msgs-release",
  ]
}

resource "github_membership" "rmf_team" {
  for_each = toset(local.rmf_team)
  username = each.value
  role = "member"
}

resource "github_team" "rmf_team" {
  name = "rmf"
  description = "ROS release managers for the rmf project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "rmf_team" {
  for_each = toset(local.rmf_team)
  team_id = github_team.rmf_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "rmf_repositories" {
  for_each = toset(local.rmf_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "rmf_team" {
  for_each = toset(local.rmf_repositories)
  team_id = github_team.rmf_team.id
  repository = each.value
  permission = "maintain"
}
