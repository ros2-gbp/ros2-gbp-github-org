locals {
  ijnek_team = [
    "ijnek",
  ]
  ijnek_repositories = [
    "nao_interfaces-release",
    "rcss3d_agent-release",
    "ros_image_to_qimage-release",
    "rqt_image_overlay-release",
    "soccer_object_msgs-release",
    "soccer_visualization-release",
  ]
}

module "ijnek_team" {
  source = "./modules/release_team"
  team_name = "ijnek"
  members = local.ijnek_team
  repositories = local.ijnek_repositories
}
