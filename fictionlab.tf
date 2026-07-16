locals {
  fictionlab_team = [
    "bjsowa",
    "jasiex01",
    "szlachcic",
  ]
  fictionlab_repositories = [
    "aruco_opencv-release",
    "leo_common-release",
    "leo_desktop-release",
    "leo_examples-ros2-release",
    "leo_robot-release",
    "leo_simulator-release",
    "raph_common-release",
    "raph_desktop-release",
    "raph_robot-release",
    "rosbag2_to_video-release",
  ]
}

module "fictionlab_team" {
  source       = "./modules/release_team"
  team_name    = "fictionlab"
  members      = local.fictionlab_team
  repositories = local.fictionlab_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
