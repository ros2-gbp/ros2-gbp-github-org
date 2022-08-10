locals {
  rt_net_team = [
    "ShotaAk",
    "Tiryoh",
    "shu-rt",
  ]
  rt_net_repositories = [
    "raspimouse2-release",
    "raspimouse_description-release",
    "raspimouse_ros2_examples-release",
    "raspimouse_slam_navigation_ros2-release",
    "rt_manipulators_cpp-release",
    "rt_usb_9axisimu_driver-release",
    "crane_plus-release",
  ]
}

module "rt_net_team" {
  source       = "./modules/release_team"
  team_name    = "rt_net"
  members      = local.rt_net_team
  repositories = local.rt_net_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
