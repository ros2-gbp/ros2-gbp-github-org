locals {
  gstavrinos_team = [
    "gstavrinos",
  ]
  gstavrinos_repositories = [
    "doom_ros-release",
    "odom_to_tf_ros2-release",
    "video_to_image_msg_publisher-release",
  ]
}

module "gstavrinos_team" {
  source       = "./modules/release_team"
  team_name    = "gstavrinos"
  members      = local.gstavrinos_team
  repositories = local.gstavrinos_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
