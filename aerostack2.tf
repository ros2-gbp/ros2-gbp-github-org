locals {
  aerostack2_team = [
    "RPS98",
    "javilinos",
    "miferco97",
    "pariaspe",
    "perezsaura-david",
  ]
  aerostack2_repositories = [
    "aerostack2-release",
  ]
}

module "aerostack2_team" {
  source       = "./modules/release_team"
  team_name    = "aerostack2"
  members      = local.aerostack2_team
  repositories = local.aerostack2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
