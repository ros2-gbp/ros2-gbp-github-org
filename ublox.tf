locals {
  ublox_team = [
    "Timple",
  ]
  ublox_repositories = [
    "ublox-release",
  ]
}

module "ublox_team" {
  source       = "./modules/release_team"
  team_name    = "ublox"
  members      = local.ublox_team
  repositories = local.ublox_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
