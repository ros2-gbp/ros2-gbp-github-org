locals {
  beluga_team = [
    "glpuga",
    "hidmic",
    "nahueespinosa",

  ]
  beluga_repositories = [
    "beluga-release",
  ]
}

module "beluga_team" {
  source       = "./modules/release_team"
  team_name    = "beluga"
  members      = local.beluga_team
  repositories = local.beluga_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
