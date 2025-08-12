locals {
  flir_camera_driver_team = [
    "berndpfrommer",
  ]
  flir_camera_driver_repositories = [
    "flir_camera_driver-release",
  ]
}

module "flir_camera_driver_team" {
  source       = "./modules/release_team"
  team_name    = "flir_camera_driver"
  members      = local.flir_camera_driver_team
  repositories = local.flir_camera_driver_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
