locals {
  hpp_fcl_team = [
    "jcarpent",
    "jmirabel",
    "wxmerkt",
    "nim65s",
  ]
  hpp_fcl_repositories = [
    "hpp_fcl-release",
  ]
}

module "hpp_fcl_team" {
  source       = "./modules/release_team"
  team_name    = "hpp_fcl"
  members      = local.hpp_fcl_team
  repositories = local.hpp_fcl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
