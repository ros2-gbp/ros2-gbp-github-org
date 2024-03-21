locals {
  gazebo_team = [
    "ahcorde",
    "azeey",
    "clalancette",
    "j-rivero",
    "mjcarroll",
  ]
  gazebo_repositories = [
    "gazebo_ros2_control-release",
    "gazebo_ros_pkgs-release",
    "gz_cmake2_vendor-release",
    "gz_cmake_vendor-release",
    "gz_common_vendor-release",
    "gz_dartsim_vendor-release",
    "gz_fuel_tools_vendor-release",
    "gz_gui_vendor-release",
    "gz_launch_vendor-release",
    "gz_math6_vendor-release",
    "gz_math_vendor-release",
    "gz_msgs_vendor-release",
    "gz_ogre_next_vendor-release",
    "gz_physics_vendor-release",
    "gz_plugin_vendor-release",
    "gz_rendering_vendor-release",
    "gz_sensors_vendor-release",
    "gz_sim_vendor-release",
    "gz_tools_vendor-release",
    "gz_transport_vendor-release",
    "gz_utils_vendor-release",
    "ign_ros2_control-release",
    "ign_rviz-release",
    "ros_ign-release",
    "sdformat_vendor-release",
  ]
}

module "gazebo_team" {
  source       = "./modules/release_team"
  team_name    = "gazebo"
  members      = local.gazebo_team
  repositories = local.gazebo_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
