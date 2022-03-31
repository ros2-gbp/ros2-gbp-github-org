locals {
  diagnostics_team = [
    "Karsten1987",
    "norro",
  ]
  diagnostics_repositories = [
    "diagnostics-release",
  ]
}

module "diagnostics_team" {
  source       = "./modules/release_team"
  team_name    = "diagnostics"
  members      = local.diagnostics_team
  repositories = local.diagnostics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
