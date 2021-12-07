resource "github_team" "release_team" {
  name = var.team_name
  description = "ROS release managers for the ${var.team_name} project"
  privacy = "closed"
  create_default_maintainer = false
  lifecycle {
    ignore_changes = [ etag ]
  }

}

resource "github_team_membership" "release_team" {
  for_each = toset(var.members)
  team_id = github_team.release_team.id
  username = each.value
  role = "member"
  lifecycle {
    ignore_changes = [ etag ]
  }
}

resource "github_team_repository" "release_team" {
  for_each = toset(var.repositories)
  team_id = github_team.release_team.id
  repository = each.value
  permission = "maintain"
  lifecycle {
    ignore_changes = [ etag ]
  }
}
