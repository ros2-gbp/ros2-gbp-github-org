locals {
  sports_team = [
    "ijnek"
  ]

  sports_repositories = [
    "game_controller_spl-release",
    "r2r_spl-release",
    "rcss3d_agent-release",
    "rcss3d_nao-release",
    "ros_image_to_qimage-release",
    "rot_conv_lib-release",
    "rqt_image_overlay-release",
    "soccer_interfaces-release",
    "soccer_vision_2d_layers-release",
    "soccer_vision_3d_rviz_markers-release",
    "vision_msgs_layers-release",
  ]
}

module "sports_team" {
  source       = "./modules/release_team"
  team_name    = "sports"
  members      = local.sports_team
  repositories = local.sports_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
