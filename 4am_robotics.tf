locals {
  4am_robotics_team = [
    "Deleh",
    "benmaidel",
  ]
  4am_robotics_repositories = [
    "cob_common-release"
  ]
}

module "4am_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "4am-robotics"
  members      = local.4am_robotics_team
  repositories = local.4am_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
