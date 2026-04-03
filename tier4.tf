locals {
  tier4_team = [
    "mitsudome-r",
    "mojomex",
    "amadeuszsz",
    "sykwer",
  ]
  tier4_repositories = [
    "callback_isolated_executor-release",
    "cudnn_cmake_module-release",
    "hash_library_vendor-release",
    "heaphook-release",
    "nebula-release",
    "osqp_vendor-release",
    "sync_tooling_msgs-release",
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

