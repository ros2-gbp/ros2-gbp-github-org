locals {
  control_team = [
    "Karsten1987",
    "bmagyar",
  ]
  control_repositories = [
    "control_msgs-release",
    "control_toolbox-release",
    "realtime_tools-release",
    "ros2_control-release",
    "ros2_controllers-release",
    "teleop_tools-release",
  ]
}

module "control_team" {
  source       = "./modules/release_team"
  team_name    = "control"
  members      = local.control_team
  repositories = local.control_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
