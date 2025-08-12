locals {
  openarm_team = [
    "thomasonzhou",
  ]
  openarm_repositories = [
    "openarm_ros2-release",
  ]
}

module "openarm_team" {
  source       = "./modules/release_team"
  team_name    = "openarm"
  members      = local.openarm_team
  repositories = local.openarm_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
