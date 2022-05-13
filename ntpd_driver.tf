locals {
  ntpd_driver_team = [
    "vooon",
  ]
  ntpd_driver_repositories = [
    "ntpd_driver-release",
  ]
}

module "ntpd_driver_team" {
  source       = "./modules/release_team"
  team_name    = "ntpd_driver"
  members      = local.ntpd_driver_team
  repositories = local.ntpd_driver_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
