locals {
  velodyne_simulator_team = [
    "kmhallen",
  ]
  velodyne_simulator_repositories = [
    "velodyne_simulator-release",
  ]
}

module "velodyne_simulator_team" {
  source       = "./modules/release_team"
  team_name    = "velodyne_simulator"
  members      = local.velodyne_simulator_team
  repositories = local.velodyne_simulator_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}

