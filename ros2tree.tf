locals {
  ros2tree_team = [
    "ishaanbhimwal",
  ]
  ros2tree_repositories = [
    "ros2tree-release",
  ]
}

module "ros2tree_team" {
  source       = "./modules/release_team"
  team_name    = "ros2tree"
  members      = local.ros2tree_team
  repositories = local.ros2tree_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
