locals {
  data_tamer_team = [
    "facontidavide",
  ]
  data_tamer_repositories = [
    "data_tamer-release",
  ]
}

module "data_tamer_team" {
  source       = "./modules/release_team"
  team_name    = "data_tamer"
  members      = local.data_tamer_team
  repositories = local.data_tamer_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
