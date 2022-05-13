locals {
  v4l2_camera_team = [
  ]
  v4l2_camera_repositories = [
    "ros2_v4l2_camera-release",
  ]
}

module "v4l2_camera_team" {
  source       = "./modules/release_team"
  team_name    = "v4l2_camera"
  members      = local.v4l2_camera_team
  repositories = local.v4l2_camera_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
