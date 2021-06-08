# vim:ft=terraform

locals {
  behaviortree_team = [
    "facontidavide",
  ]
  behaviortree_repositories = [
    "behaviortree_cpp-release",
  ]
}

resource "github_membership" "behaviortree_team" {
  for_each = toset(local.behaviortree_team)
  username = each.value
  role = "member"
}

resource "github_team" "behaviortree_team" {
  name = "behaviortree"
  description = "ROS release managers for the behaviortree project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "behaviortree_team" {
  for_each = toset(local.behaviortree_team)
  team_id = github_team.behaviortree_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "behaviortree_repositories" {
  for_each = toset(local.behaviortree_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "behaviortree_team" {
  for_each = toset(local.behaviortree_repositories)
  team_id = github_team.behaviortree_team.id
  repository = each.value
  permission = "maintain"
}
