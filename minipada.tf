locals {
  minipada_team = [
    "Minipada",
  ]
  minipada_repositories = [
    "fluent_bit_vendor-release",
  ]
}

module "minipada_team" {
  source       = "./modules/release_team"
  team_name    = "minipada"
  members      = local.minipada_team
  repositories = local.minipada_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
