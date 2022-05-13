locals {
  ouxt_team = [
    "hakuturu583",
  ]
  ouxt_repositories = [
    "color_names-release",
    "nmea_hardware_interface-release",
    "ouxt_common-release",
    "quaternion_operation-release",
    "sol_vendor-release",
  ]
}

module "ouxt_team" {
  source       = "./modules/release_team"
  team_name    = "ouxt"
  members      = local.ouxt_team
  repositories = local.ouxt_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
