locals {
  visualization_team = [
    "tonybaltovski",
  ]
  visualization_repositories = [
    "interactive_marker_twist_server-release",
  ]
}

module "visualization_team" {
  source       = "./modules/release_team"
  team_name    = "visualization"
  members      = local.visualization_team
  repositories = local.visualization_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
