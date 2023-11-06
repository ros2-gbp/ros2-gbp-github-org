locals {
  odri_team = [
    "olivier-stasse",
    "nim65s",
    "MaximilienNaveau",
  ]
  odri_repositories = [
    "odri_master_board_sdk-release",
  ]
}

module "odri_team" {
  source       = "./modules/release_team"
  team_name    = "odri"
  members      = local.odri_team
  repositories = local.odri_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
