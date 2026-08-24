locals {
  gbionics_team = [
    "GiulioRomualdi",
    "S-Dafarra",
    "traversaro",
  ]
  gbionics_repositories = [
    "osqp_eigen-release",
  ]
}

module "gbionics_team" {
  source       = "./modules/release_team"
  team_name    = "gbionics"
  members      = local.gbionics_team
  repositories = local.gbionics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
