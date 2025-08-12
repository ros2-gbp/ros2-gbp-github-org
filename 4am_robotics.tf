locals {
  _4am_robotics_team = [
    "Deleh",
    "benmaidel",
  ]
  _4am_robotics_repositories = [
    "cob_common-release"
  ]
}

module "_4am_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "4am-robotics"
  members      = local._4am_robotics_team
  repositories = local._4am_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
