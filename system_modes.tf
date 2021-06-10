locals {
  system_modes_team = [
    "norro",
  ]
  system_modes_repositories = [
    "system_modes-release",
  ]
}

module "system_modes_team" {
  source = "./modules/release_team"
  team_name = "system_modes"
  members = local.system_modes_team
  repositories = local.system_modes_team
}
