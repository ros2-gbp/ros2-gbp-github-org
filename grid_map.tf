locals {
  grid_map_team = [
    "maximilianwulf",
    "wep21",
  ]
  grid_map_repositories = [
    "grid_map-release",
  ]
}

module "grid_map_team" {
  source       = "./modules/release_team"
  team_name    = "grid_map"
  members      = local.grid_map_team
  repositories = local.grid_map_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
