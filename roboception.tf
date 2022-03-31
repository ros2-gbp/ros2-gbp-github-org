locals {
  roboception_team = [
    "flixr",
  ]
  roboception_repositories = [
    "rc_common_msgs_ros2-release",
    "rc_dynamics_api-release",
    "rc_genicam_api-release",
    "rc_genicam_driver_ros2-release",
    "rc_reason_clients-release",
    "rcdiscover-release",
  ]
}

module "roboception_team" {
  source       = "./modules/release_team"
  team_name    = "roboception"
  members      = local.roboception_team
  repositories = local.roboception_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
