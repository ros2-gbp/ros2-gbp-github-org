locals {
  urg_team = [
    "mikeferguson",
  ]
  urg_repositories = [
    "urg_c-release",
    "urg_node-release",
    "urg_node_msgs-release",
  ]
}

module "urg_team" {
  source       = "./modules/release_team"
  team_name    = "urg"
  members      = local.urg_team
  repositories = local.urg_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
