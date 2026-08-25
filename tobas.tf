locals {
  tobas_team = [
    "Masa0u0",
  ]
  tobas_repositories = [
    "tobas-release",
  ]
}

module "tobas_team" {
  source       = "./modules/release_team"
  team_name    = "tobas"
  members      = local.tobas_team
  repositories = local.tobas_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
