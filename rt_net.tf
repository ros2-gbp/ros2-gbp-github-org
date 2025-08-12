locals {
  rt_net_team = [
    "KuraZuzu",
    "Kuwamai",
    "YusukeKato",
    "chama1176",
  ]
  rt_net_repositories = [
    "crane_plus-release",
    "raspimouse2-release",
    "raspimouse_description-release",
    "raspimouse_ros2_examples-release",
    "raspimouse_sim-release",
    "raspimouse_slam_navigation_ros2-release",
    "rt_manipulators_cpp-release",
    "rt_usb_9axisimu_driver-release",
  ]
}

module "rt_net_team" {
  source       = "./modules/release_team"
  team_name    = "rt_net"
  members      = local.rt_net_team
  repositories = local.rt_net_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
