locals {
  nobleo_team = [
    "Timple",
    "Rayman",
  ]
  nobleo_repositories = [
    "azure_iot_sdk_c-release",
    "boost_sml_vendor-release",
    "libnabo-release",
    "libpointmatcher-release",
    "magic_enum-release",
    "mp_units_vendor-release",
    "nobleo_socketcan_bridge-release",
    "pfs-release",
    "ros2_fmt_logger-release",
    "rslidar_msg-release",
    "rslidar_sdk-release",
    "rtcm_msgs-release",
    "rviz_satellite-release",
    "steering_functions-release",
  ]
}

module "nobleo_team" {
  source       = "./modules/release_team"
  team_name    = "nobleo"
  members      = local.nobleo_team
  repositories = local.nobleo_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
