locals {
  humanoid_robot_intelligence_control_system_tools_team = [
    "RonaldsonBellande",
  ]
  humanoid_robot_intelligence_control_system_tools_repositories = [
    "humanoid_robot_intelligence_control_system_tools-release",
  ]
}

module "humanoid_robot_intelligence_control_system_tools_team" {
  source       = "./modules/release_team"
  team_name    = "humanoid_robot_intelligence_control_system_tools"
  members      = local.humanoid_robot_intelligence_control_system_tools_team
  repositories = local.humanoid_robot_intelligence_control_system_tools_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
