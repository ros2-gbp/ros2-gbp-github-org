locals {
  tier4_team = [
    "wep21",
  ]
  tier4_repositories = [
    "hash_library_vendor-release",
    "osqp_vendor-release",
  ]
}

module "tier4_team" {
  source = "./modules/release_team"
  team_name = "tier4"
  members = local.tier4_team
  repositories = local.tier4_repositories
}

