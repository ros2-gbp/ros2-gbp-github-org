locals {
  polymath_robotics_team = [
    "troygibb",
  ]
  polymath_robotics_repositories = [
    "replay_testing-release",
  ]
}

module "polymath_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "polymath_robotics"
  members      = local.polymath_robotics_team
  repositories = local.polymath_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
