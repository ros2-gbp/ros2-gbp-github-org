locals {
  humanoid_robot_intelligence_control_system_module_team = [
    "RonaldsonBellande",
  ]
  humanoid_robot_intelligence_control_system_module_repositories = [
    "humanoid_robot_intelligence_control_system_module-release",
  ]
}

module "humanoid_robot_intelligence_control_system_module_team" {
  source       = "./modules/release_team"
  team_name    = "humanoid_robot_intelligence_control_system_module"
  members      = local.humanoid_robot_intelligence_control_system_module_team
  repositories = local.humanoid_robot_intelligence_control_system_module_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
