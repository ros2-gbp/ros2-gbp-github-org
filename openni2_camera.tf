locals {
  openni2_camera_team = [
    "mikeferguson",
    "130s",
  ]
  openni2_camera_repositories = [
    "openni2_camera-release",
  ]
}

module "openni2_camera_team" {
  source       = "./modules/release_team"
  team_name    = "openni2_camera"
  members      = local.openni2_camera_team
  repositories = local.openni2_camera_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
