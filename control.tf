locals {
  control_team = [
    "Karsten1987",
    "bmagyar",
  ]
  control_repositories = [
    "control_toolbox-release",
    "control_msgs-release",
    "ros2_control-release",
    "ros2_controllers-release",
    "teleop_tools-release",
  ]
}

module "control_team" {
  source = "./modules/release_team"
  team_name = "control"
  members = local.control_team
  repositories = local.control_team
}
