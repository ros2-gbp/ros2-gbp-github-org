locals {
  traclabs_team = [
    "ana-GT",
    "kbrameld",
    "mlanighan",
    "nstiurca",
  ]
  traclabs_repositories = [
    "trac_ik-release",
  ]
}

module "traclabs_team" {
  source       = "./modules/release_team"
  team_name    = "traclabs"
  members      = local.traclabs_team
  repositories = local.traclabs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
