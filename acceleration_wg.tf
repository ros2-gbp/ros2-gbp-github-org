locals {
  acceleration_wg_team = [
    "vmayoral",
    "methyldragon",
  ]
  acceleration_wg_repositories = [
  ]
}

module "acceleration_wg_team" {
  source       = "./modules/release_team"
  team_name    = "acceleration_wg"
  members      = local.acceleration_wg_team
  repositories = local.acceleration_wg_repositories
}
