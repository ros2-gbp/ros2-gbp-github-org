locals {
  zenoh_team = [
    "JEnoch",
    "YuanYuYuan"
  ]
  zenoh_repositories = [
    "zenoh_bridge_dds-release",
    "rmw_zenoh-release"
  ]
}

module "zenoh_team" {
  source       = "./modules/release_team"
  team_name    = "zenoh"
  members      = local.zenoh_team
  repositories = local.zenoh_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
