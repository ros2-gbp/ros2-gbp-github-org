# vim:ft=terraform

locals {
  control_box_rst_team = [
    "croesmann",
    "control_box_rst",
  ]
  control_box_rst_repositories = [
    "control_box_rst-release",
  ]
}

resource "github_membership" "control_box_rst_team" {
  for_each = toset(local.control_box_rst_team)
  username = each.value
  role = "member"
}

resource "github_team" "control_box_rst_team" {
  name = "control_box_rst"
  description = "ROS release managers for the control_box_rst project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "control_box_rst_team" {
  for_each = toset(local.control_box_rst_team)
  team_id = github_team.control_box_rst_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "control_box_rst_repositories" {
  for_each = toset(local.control_box_rst_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "control_box_rst_team" {
  for_each = toset(local.control_box_rst_repositories)
  team_id = github_team.control_box_rst_team.id
  repository = each.value
  permission = "maintain"
}
