locals {
  ompl_team = [
    "mamoll",
  ]
  ompl_repositories = [
    "ompl-release",
  ]
}

module "ompl_team" {
  source = "./modules/release_team"
  team_name = "ompl"
  members = local.ompl_team
  repositories = local.ompl_repositories
}
