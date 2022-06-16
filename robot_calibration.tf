locals {
  robot_calibration_team = [
    "mikeferguson",
  ]
  robot_calibration_repositories = [
    "robot_calibration-release",
  ]
}

module "robot_calibration_team" {
  source       = "./modules/release_team"
  team_name    = "robot_calibration"
  members      = local.robot_calibration_team
  repositories = local.robot_calibration_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
