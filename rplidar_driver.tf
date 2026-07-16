locals {
  rplidar_driver_team = [
    "bjsowa",
    "cosmicog",
    "frozenreboot",
  ]
  rplidar_driver_repositories = [
    "rplidar_driver-release",
  ]
}

module "rplidar_driver_team" {
  source       = "./modules/release_team"
  team_name    = "rplidar_driver"
  members      = local.rplidar_driver_team
  repositories = local.rplidar_driver_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
