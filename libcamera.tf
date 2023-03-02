locals {
  libcamera_team = [
    "christianrauch",
  ]
  libcamera_repositories = [
    "camera_ros-release",
    "libcamera-release",
  ]
}

module "libcamera_team" {
  source       = "./modules/release_team"
  team_name    = "libcamera"
  members      = local.libcamera_team
  repositories = local.libcamera_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
