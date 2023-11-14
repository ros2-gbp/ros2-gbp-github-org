locals {
  humanoid_robot_intelligence_control_system_messages_team = [
    "RonaldsonBellande",
  ]
  humanoid_robot_intelligence_control_system_messages_repositories = [
    "humanoid_robot_intelligence_control_system_messages-release",
  ]
}

module "humanoid_robot_intelligence_control_system_messages_team" {
  source       = "./modules/release_team"
  team_name    = "humanoid_robot_intelligence_control_system_messages"
  members      = local.humanoid_robot_intelligence_control_system_messages_team
  repositories = local.humanoid_robot_intelligence_control_system_messages_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
