locals {
  cerberus_team = [
    "2b-t",
  ]
  cerberus_repositories = [
    "myactuator_rmd-release",
  ]
}

module "cerberus_team" {
  source       = "./modules/release_team"
  team_name    = "cerberus"
  members      = local.cerberus_team
  repositories = local.cerberus_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
