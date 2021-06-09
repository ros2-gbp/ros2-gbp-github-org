# vim:ft=terraform

locals {
  async_web_server_cpp_team = [
    "roehling",
  ]
  async_web_server_cpp_repositories = [
    "async_web_server_cpp-release",
    "async_web_server_cpp-release",
  ]
}

resource "github_membership" "async_web_server_cpp_team" {
  for_each = toset(local.async_web_server_cpp_team)
  username = each.value
  role = "member"
}

resource "github_team" "async_web_server_cpp_team" {
  name = "async_web_server_cpp"
  description = "ROS release managers for the async_web_server_cpp project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "async_web_server_cpp_team" {
  for_each = toset(local.async_web_server_cpp_team)
  team_id = github_team.async_web_server_cpp_team.id
  username = each.value
  role = "member"
}

resource "github_repository" "async_web_server_cpp_repositories" {
  for_each = toset(local.async_web_server_cpp_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "async_web_server_cpp_team" {
  for_each = toset(local.async_web_server_cpp_repositories)
  team_id = github_team.async_web_server_cpp_team.id
  repository = each.value
  permission = "maintain"
}
