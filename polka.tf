locals {
  polka_team = [
    "Pana1v",
  ]
  polka_repositories = [
    "polka-release",
  ]
}

module "polka_team" {
  source       = "./modules/release_team"
  team_name    = "polka"
  members      = local.polka_team
  repositories = local.polka_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
