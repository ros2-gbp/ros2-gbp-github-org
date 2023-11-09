locals {
  humanoid_robot_framework_team = [
    "RonaldsonBellande",
  ]
  humanoid_robot_framework_repositories = [
    "humanoid_robot_framework-release",
  ]
}

module "humanoid_robot_framework_team" {
  source       = "./modules/release_team"
  team_name    = "humanoid_robot_framework"
  members      = local.humanoid_robot_framework_team
  repositories = local.humanoid_robot_framework_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
