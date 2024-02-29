locals {
  interactive_marker_twist_team = [
    "tonybaltovski",
  ]
  interactive_marker_twist_repositories = [
    "interactive_marker_twist_server-release",
  ]
}

module "interactive_marker_twist_team" {
  source       = "./modules/release_team"
  team_name    = "interactive_marker_twist"
  members      = local.interactive_marker_twist_team
  repositories = local.interactive_marker_twist_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
