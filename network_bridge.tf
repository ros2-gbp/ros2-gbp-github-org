locals {
  network_bridge_team = [
    "brow1633",
  ]
  network_bridge_repositories = [
    "network_bridge-release",
  ]
}

module "network_bridge_team" {
  source       = "./modules/release_team"
  team_name    = "network_bridge"
  members      = local.network_bridge_team
  repositories = local.network_bridge_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
