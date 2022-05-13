locals {
  system_modes_team = [
    "norro",
    "ralph-lange",
  ]
  system_modes_repositories = [
    "system_modes-release",
  ]
}

module "system_modes_team" {
  source       = "./modules/release_team"
  team_name    = "system_modes"
  members      = local.system_modes_team
  repositories = local.system_modes_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
