locals {
  ros_industrial_team = [
    "Levi-Armstrong",
    "hellantos",
    "ipa-vsp",
    "marip8",
  ]
  ros_industrial_repositories = [
    "reach-release",
    "reach_ros2-release",
    "ros2_canopen-release",
    "ros_industrial_cmake_boilerplate-release",
    "stomp-release",
  ]
}

module "ros_industrial_team" {
  source       = "./modules/release_team"
  team_name    = "ros_industrial"
  members      = local.ros_industrial_team
  repositories = local.ros_industrial_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
