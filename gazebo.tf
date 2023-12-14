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
    "gz_math6_vendor-release",
    "ign_ros2_control-release",
    "ign_rviz-release",
    "ros_ign-release",
  ]
}

module "gazebo_team" {
  source       = "./modules/release_team"
  team_name    = "gazebo"
  members      = local.gazebo_team
  repositories = local.gazebo_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
