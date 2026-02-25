locals {
  autoware_team = [
    "esteve",
    "mitsudome-r",
    "xmfcx",
    "youtalk",
    "soblin",
    "sykwer",
  ]

  autoware_repositories = [
    "acado_vendor-release",
    "agnocast-release",
    "autoware_adapi_msgs-release",
    "autoware_auto_msgs-release",
    "autoware_cmake-release",
    "autoware_core-release",
    "autoware_internal_msgs-release",
    "autoware_lanelet2_extension-release",
    "autoware_msgs-release",
    "autoware_rviz_plugins-release",
    "autoware_utils-release",
    "qpoases_vendor-release",
    "ros2_socketcan-release",
    "tvm_vendor-release",
    "zmqpp_vendor-release",
  ]
}

module "autoware_team" {
  source       = "./modules/release_team"
  team_name    = "autoware"
  members      = local.autoware_team
  repositories = local.autoware_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
