locals {
  realsense_team = [
    "SamerKhshiboun",
    "IntelRealSense",
    "Nir-Az"
  ]
  realsense_repositories = [
    "librealsense2-release",
    "realsense-ros-release",
  ]
}

module "realsense_team" {
  source       = "./modules/release_team"
  team_name    = "realsense"
  members      = local.realsense_team
  repositories = local.realsense_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
