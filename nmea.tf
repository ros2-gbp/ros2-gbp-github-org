locals {
  nmea_team = [
    "evenator",
  ]
  nmea_repositories = [
    "nmea_msgs-release",
    "nmea_navsat_driver-release",
  ]
}

module "nmea_team" {
  source       = "./modules/release_team"
  team_name    = "nmea"
  members      = local.nmea_team
  repositories = local.nmea_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
