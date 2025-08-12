locals {
  simple_grasping_team = [
    "mikeferguson",
  ]
  simple_grasping_repositories = [
    "grasping_msgs-release",
    "simple_grasping-release",
  ]
}

module "simple_grasping_team" {
  source       = "./modules/release_team"
  team_name    = "simple_grasping"
  members      = local.simple_grasping_team
  repositories = local.simple_grasping_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
