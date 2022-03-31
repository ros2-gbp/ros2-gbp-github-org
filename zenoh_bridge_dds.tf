locals {
  zenoh_bridge_dds_team = [
    "JEnoch",
  ]
  zenoh_bridge_dds_repositories = [
    "zenoh_bridge_dds-release",
  ]
}

module "zenoh_bridge_dds_team" {
  source       = "./modules/release_team"
  team_name    = "zenoh_bridge_dds"
  members      = local.zenoh_bridge_dds_team
  repositories = local.zenoh_bridge_dds_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
