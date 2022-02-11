locals {
  visp_team = [
    "fspidle",
  ]
  visp_repositories = [
    "visp-release",
  ]
}

module "visp_team" {
  source = "./modules/release_team"
  team_name = "visp"
  members = local.visp_team
  repositories = local.visp_repositories
}
