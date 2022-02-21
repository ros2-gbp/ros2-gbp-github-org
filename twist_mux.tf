locals {
  twist_mux_team = [
    "bmagyar",
  ]
  twist_mux_repositories = [
    "twist_mux-release",
  ]
}

module "twist_mux_team" {
  source       = "./modules/release_team"
  team_name    = "twist_mux"
  members      = local.twist_mux_team
  repositories = local.twist_mux_repositories
}
