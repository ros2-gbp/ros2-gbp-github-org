# vim:ft=terraform

locals {
  libg2o_team = [
    "croesmann",
  ]
  libg2o_repositories = [
    "libg2o-release",
  ]
}

resource "github_membership" "libg2o_team" {
  for_each = toset(local.libg2o_team)
  username = each.value
  role = "member"
}

resource "github_team" "libg2o_team" {
  name = "libg2o"
  description = "ROS release managers for the libg2o project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "libg2o_team" {
  for_each = toset(local.libg2o_team)
  team_id = github_team.libg2o_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "libg2o_repositories" {
  for_each = toset(local.libg2o_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "libg2o_team" {
  for_each = toset(local.libg2o_repositories)
  team_id = github_team.libg2o_team.id
  repository = each.value
  permission = "maintain"
}
