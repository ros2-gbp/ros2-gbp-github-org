locals {
  foxglove_bridge_team = [
    "achim-k",
    "amacneil",
    "defunctzombie",
    "jhurliman",
    "jtbandes",
  ]
  foxglove_bridge_repositories = [
    "foxglove_bridge-release",
  ]
}

module "foxglove_bridge_team" {
  source       = "./modules/release_team"
  team_name    = "foxglove_bridge"
  members      = local.foxglove_bridge_team
  repositories = local.foxglove_bridge_repositories
}
