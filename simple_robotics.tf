locals {
  simple_robotics_team = [
    "jcarpent",
    "wxmerkt",
  ]
  simple_robotics_repositories = [
    "proxsuite-release",
  ]
}

module "simple_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "simple_robotics"
  members      = local.simple_robotics_team
  repositories = local.simple_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
