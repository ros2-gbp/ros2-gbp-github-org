locals {
  prbonn_team = [
    "mehermvr",
  ]
  prbonn_repositories = [
    "rko_lio-release",
  ]
}

module "prbonn_team" {
  source       = "./modules/release_team"
  team_name    = "prbonn"
  members      = local.prbonn_team
  repositories = local.prbonn_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
