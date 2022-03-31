locals {
  sports_team = [
    "ijnek"
  ]

  sports_repositories = [
    "rcss3d_agent-release",
    "ros_image_to_qimage-release",
    "rot_conv_lib-release",
    "rqt_image_overlay-release",
    "soccer_interfaces-release",
  ]
}

module "sports_team" {
  source       = "./modules/release_team"
  team_name    = "sports"
  members      = local.sports_team
  repositories = local.sports_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
