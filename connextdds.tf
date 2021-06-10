locals {
  connextdds_team = [
    "asorbini",
  ]
  connextdds_repositories = [
    "rmw_connextdds-release",
  ]
}

module "connextdds_team" {
  source = "./modules/release_team"
  team_name = "connextdds"
  members = local.connextdds_team
  repositories = local.connextdds_repositories
}
