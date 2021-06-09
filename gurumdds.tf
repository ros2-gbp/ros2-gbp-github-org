# vim:ft=terraform

locals {
  gurumdds_team = [
    "YoungJin-gurum",
    "jaemin-gurumnet",
  ]
  gurumdds_repositories = [
    "rmw_gurumdds-release",
    "rosidl_typesupport_gurumdds-release",
  ]
}

resource "github_membership" "gurumdds_team" {
  for_each = toset(local.gurumdds_team)
  username = each.value
  role = "member"
}

resource "github_team" "gurumdds_team" {
  name = "gurumdds"
  description = "ROS release managers for the gurumdds project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "gurumdds_team" {
  for_each = toset(local.gurumdds_team)
  team_id = github_team.gurumdds_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "gurumdds_repositories" {
  for_each = toset(local.gurumdds_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "gurumdds_team" {
  for_each = toset(local.gurumdds_repositories)
  team_id = github_team.gurumdds_team.id
  repository = each.value
  permission = "maintain"
}
