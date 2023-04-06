locals {
  rplidar_team = [
    "slamtec",
    "WubinXia",
    "deyouslamtec",
  ]
  rplidar_repositories = [
    "sllidar_ros2-release",
  ]
}

module "rplidar_team" {
  source       = "./modules/release_team"
  team_name    = "rplidar"
  members      = local.rplidar_team
  repositories = local.rplidar_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
