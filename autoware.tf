locals {
  autoware_team = [
    "esteve",
    "mitsudome-r",
    "youtalk",
  ]

  autoware_repositories = [
    "acado_vendor-release",
    "autoware_adapi_msgs-release",
    "autoware_auto_msgs-release",
    "autoware_cmake-release",
    "autoware_lanelet2_extension-release",
    "autoware_msgs-release",
    "autoware_utils-release",
    "qpoases_vendor-release",
    "ros2_socketcan-release",
    "tvm_vendor-release",
  ]
}

module "autoware_team" {
  source       = "./modules/release_team"
  team_name    = "autoware"
  members      = local.autoware_team
  repositories = local.autoware_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
