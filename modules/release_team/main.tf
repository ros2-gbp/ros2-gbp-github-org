resource "github_team" "release_team" {
  name = var.team_name
  description = "ROS release managers for the ${var.team_name} project"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "release_team" {
  for_each = toset(var.members)
  team_id = github_team.release_team.id
  username = each.value
  role = "member"
}

resource "github_team_repository" "release_team" {
  for_each = toset(var.repositories)
  team_id = github_team.release_team.id
  repository = each.value
  permission = "maintain"
}
