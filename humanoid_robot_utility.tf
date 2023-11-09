locals {
  humanoid_robot_utility_team = [
    "RonaldsonBellande",
  ]
  humanoid_robot_utility_repositories = [
    "humanoid_robot_utility-release",
  ]
}

module "humanoid_robot_utility_team" {
  source       = "./modules/release_team"
  team_name    = "humanoid_robot_utility"
  members      = local.humanoid_robot_utility_team
  repositories = local.humanoid_robot_utility_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
