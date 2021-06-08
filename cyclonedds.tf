# vim:ft=terraform

locals {
  cyclonedds_team = [
    "eboasson",
    "JWhitleyWork",
    "ThijsSassen",
  ]
  cyclonedds_repositories = [
    "cyclonedds-release",
    "iceoryx-release",
    "rmw_cyclonedds-release",
  ]
}

resource "github_membership" "cyclonedds_team" {
  for_each = toset(local.cyclonedds_team)
  username = each.value
  role = "member"
}

resource "github_team" "cyclonedds_team" {
  name = "cyclonedds"
  description = "ROS release managers for the cyclonedds project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "cyclonedds_team" {
  for_each = toset(local.cyclonedds_team)
  team_id = github_team.cyclonedds_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "cyclonedds_repositories" {
  for_each = toset(local.cyclonedds_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "cyclonedds_team" {
  for_each = toset(local.cyclonedds_repositories)
  team_id = github_team.cyclonedds_team.id
  repository = each.value
  permission = "maintain"
}
