locals {
  realsense_team = [
    "Nir-Az",
    "ashrafk93",
    "remibettan",
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
