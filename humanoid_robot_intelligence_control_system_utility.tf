locals {
  humanoid_robot_intelligence_control_system_utility_team = [
    "RonaldsonBellande",
  ]
  humanoid_robot_intelligence_control_system_utility_repositories = [
    "humanoid_robot_intelligence_control_system_utility-release",
  ]
}

module "humanoid_robot_intelligence_control_system_utility_team" {
  source       = "./modules/release_team"
  team_name    = "humanoid_robot_intelligence_control_system_utility"
  members      = local.humanoid_robot_intelligence_control_system_utility_team
  repositories = local.humanoid_robot_intelligence_control_system_utility_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
