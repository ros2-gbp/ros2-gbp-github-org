locals {
  orbbec_camera_team = [
    "obyalian",
  ]

  orbbec_camera_repositories = [
    "orbbec_camera_v1-release",
    "orbbec_camera_v2-release",
  ]
}

module "orbbec_camera" {
  source       = "./modules/release_team"
  team_name    = "orbbec_camera"
  members      = local.orbbec_camera_team
  repositories = local.orbbec_camera_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
