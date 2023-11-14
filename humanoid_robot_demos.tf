locals {
  humanoid_robot_intelligence_control_system_demos_team = [
    "RonaldsonBellande",
  ]
  humanoid_robot_intelligence_control_system_demos_repositories = [
    "humanoid_robot_intelligence_control_system_demos-release",
  ]
}

module "humanoid_robot_intelligence_control_system_demos_team" {
  source       = "./modules/release_team"
  team_name    = "humanoid_robot_intelligence_control_system_demos"
  members      = local.humanoid_robot_intelligence_control_system_demos_team
  repositories = local.humanoid_robot_intelligence_control_system_demos_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
