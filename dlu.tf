locals {
  dlu_team = [
    "DLu",
  ]
  dlu_repositories = [
    "simple_actions-release",
  ]
}

module "dlu_team" {
  source       = "./modules/release_team"
  team_name    = "dlu"
  members      = local.dlu_team
  repositories = local.dlu_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
