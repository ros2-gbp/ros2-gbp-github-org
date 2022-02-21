locals {
  iceoryx_team = [
    "dkroenke",
    "elBoberido",
    "mossmaurice",
  ]
  iceoryx_repositories = [
    "iceoryx-release",
  ]
}

module "iceoryx_team" {
  source       = "./modules/release_team"
  team_name    = "iceoryx"
  members      = local.iceoryx_team
  repositories = local.iceoryx_repositories
}
