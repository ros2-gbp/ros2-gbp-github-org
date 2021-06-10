locals {
  autoware_team = [
    "JWhitleyWork",
  ]

  autoware_repositories = [
    "acado_vendor-release",
    "autoware_auto_msgs-release",
    "ros2_socketcan-release",
  ]
}

module "autoware_team" {
  source = "./modules/release_team"
  team_name = "autoware"
  members = local.autoware_team
  repositories = local.autoware_repositories
}
