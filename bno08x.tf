locals {
  bno08x_team = [
    "bnbhat",
  ]
  bno08x_repositories = [
    "bno08x_driver-release",
  ]
}

module "bno08x_team" {
  source       = "./modules/release_team"
  team_name    = "bno08x"
  members      = local.bno08x_team
  repositories = local.bno08x_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
