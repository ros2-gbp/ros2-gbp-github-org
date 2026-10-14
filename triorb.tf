locals {
  triorb_team = [
    "fujitatomoya",
  ]
  triorb_repositories = [
    "rcl_logging_journal-release",
  ]
}

module "triorb_team" {
  source       = "./modules/release_team"
  team_name    = "triorb"
  members      = local.triorb_team
  repositories = local.triorb_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
