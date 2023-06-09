locals {
  rplidar_ros_team = [
    "WubinXia",
    "allenh1",
    "deyouslamtec",
  ]
  rplidar_ros_repositories = [
    "rplidar_ros-release",
  ]
}

module "rplidar_ros_team" {
  source       = "./modules/release_team"
  team_name    = "rplidar_ros"
  members      = local.rplidar_ros_team
  repositories = local.rplidar_ros_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
