locals {
  tooling_wg_team = [
    "emersonknapp",
    "lihui815",
  ]
  tooling_wg_repositories = [
    "keyboard_handler-release",
    "libstatistics_collector-release",
  ]
}

module "tooling_wg_team" {
  source       = "./modules/release_team"
  team_name    = "tooling_wg"
  members      = local.tooling_wg_team
  repositories = local.tooling_wg_repositories
}
