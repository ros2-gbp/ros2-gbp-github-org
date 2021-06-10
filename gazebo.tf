locals {
  gazebo_team = [
    "ahcorde",
    "chapulina",
    "j-rivero",
  ]
  gazebo_repositories = [
    "gazebo_ros2_control-release",
    "gazebo_ros_pkgs-release",
    "ign_rviz-release",
    "ros_ign-release",
  ]
}

module "gazebo_team" {
  source = "./modules/release_team"
  team_name = "gazebo"
  members = local.gazebo_team
  repositories = local.gazebo_repositories
}
