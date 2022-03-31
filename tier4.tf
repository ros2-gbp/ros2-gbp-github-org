locals {
  tier4_team = [
    "kenji-miyake",
    "wep21",
  ]
  tier4_repositories = [
    "cudnn_cmake_module-release",
    "hash_library_vendor-release",
    "osqp_vendor-release",
    "tensorrt_cmake_module-release",
  ]
}

module "tier4_team" {
  source       = "./modules/release_team"
  team_name    = "tier4"
  members      = local.tier4_team
  repositories = local.tier4_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}

