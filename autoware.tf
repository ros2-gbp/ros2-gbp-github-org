locals {
  autoware_team = [
    "JWhitleyWork",
    "kenji-miyake",
    "mitsudome-r",
    "wep21",
  ]

  autoware_repositories = [
    "acado_vendor-release",
    "autoware_auto_msgs-release",
    "ros2_socketcan-release",
    "tvm_vendor-release",
  ]
}

module "autoware_team" {
  source = "./modules/release_team"
  team_name = "autoware"
  members = local.autoware_team
  repositories = local.autoware_repositories
}
