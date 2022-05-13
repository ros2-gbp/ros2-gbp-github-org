locals {
  robotis_team = [
    "ROBOTIS-Will",
  ]
  robotis_repositories = [
    "dynamixel_sdk-release",
    "hls_lfcd_lds_driver-release",
    "turtlebot3_msgs-release",
    "turtlebot3_simulations-release",
  ]
}

module "robotis_team" {
  source       = "./modules/release_team"
  team_name    = "robotis"
  members      = local.robotis_team
  repositories = local.robotis_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
