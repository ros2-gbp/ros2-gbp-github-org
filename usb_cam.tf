locals {
  usb_cam_team = [
    "flynneva",
  ]
  usb_cam_repositories = [
    "usb_cam-release",
  ]
}

module "usb_cam_team" {
  source       = "./modules/release_team"
  team_name    = "usb_cam"
  members      = local.usb_cam_team
  repositories = local.usb_cam_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
