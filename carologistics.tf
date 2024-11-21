locals {
  carologistics_team = [
    "TarikViehmann",
    "techtasie",
  ]
  carologistics_repositories = [
    "clips_vendor-release",
  ]
}

module "carologistics_team" {
  source       = "./modules/release_team"
  team_name    = "carologistics"
  members      = local.carologistics_team
  repositories = local.carologistics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
