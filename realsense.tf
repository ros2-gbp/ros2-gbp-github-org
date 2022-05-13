locals {
  realsense_team = [
    "doronhi",
  ]
  realsense_repositories = [
    "librealsense-release",
    "ros2_intel_realsense-release",
  ]
}

module "realsense_team" {
  source       = "./modules/release_team"
  team_name    = "realsense"
  members      = local.realsense_team
  repositories = local.realsense_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
