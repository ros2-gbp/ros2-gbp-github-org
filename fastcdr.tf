# vim:ft=terraform

locals {
  fastcdr_team = [
    "EduPonz",
  ]
  fastcdr_repositories = [
    "fastcdr-release",
    "fastrtps-release",
    "foonathan_memory_vendor-release",
    "rmw_fastrtps-release",
    "rosidl_typesupport_fastrtps-release",
  ]
}

resource "github_membership" "fastcdr_team" {
  for_each = toset(local.fastcdr_team)
  username = each.value
  role = "member"
}

resource "github_team" "fastcdr_team" {
  name = "fastcdr"
  description = "ROS release managers for the fastcdr project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "fastcdr_team" {
  for_each = toset(local.fastcdr_team)
  team_id = github_team.fastcdr_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "fastcdr_repositories" {
  for_each = toset(local.fastcdr_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "fastcdr_team" {
  for_each = toset(local.fastcdr_repositories)
  team_id = github_team.fastcdr_team.id
  repository = each.value
  permission = "maintain"
}
