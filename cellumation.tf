locals {
  cellumation_team = [
    "arneboe",
    "jmachowinski",
    "kohrt",
  ]
  cellumation_repositories = [
    "cm_executors-release",
  ]
}

module "cellumation_team" {
  source       = "./modules/release_team"
  team_name    = "cellumation"
  members      = local.cellumation_team
  repositories = local.cellumation_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
