locals {
  scenario_execution_team = [
    "fmirus",
    "fred-labs",
  ]
  scenario_execution_repositories = [
    "scenario_execution-release",
  ]
}

module "scenario_execution_team" {
  source       = "./modules/release_team"
  team_name    = "scenario_execution"
  members      = local.scenario_execution_team
  repositories = local.scenario_execution_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
