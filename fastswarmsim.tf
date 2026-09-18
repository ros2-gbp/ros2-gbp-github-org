locals {
  fastswarmsim_team = [
    "shupx",
  ]
  fastswarmsim_repositories = [
    "fastswarmsim-release",
  ]
}

module "fastswarmsim_team" {
  source       = "./modules/release_team"
  team_name    = "fastswarmsim"
  members      = local.fastswarmsim_team
  repositories = local.fastswarmsim_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
