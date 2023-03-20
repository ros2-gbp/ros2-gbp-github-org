locals {
  aussierobots_team = [
    "hortovanyi",
  ]
  aussierobots_repositories = [
    "ublox_dgnss-release",
  ]
}

module "aussierobots_team" {
  source       = "./modules/release_team"
  team_name    = "aussierobots"
  members      = local.aussierobots_team
  repositories = local.aussierobots_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
