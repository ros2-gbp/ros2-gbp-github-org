locals {
  robot_localization_team = [
    "SteveMacenski",
  ]
  robot_localization_repositories = [
    "robot_localization-release",
  ]
}

module "robot_localization_team" {
  source       = "./modules/release_team"
  team_name    = "robot_localization"
  members      = local.robot_localization_team
  repositories = local.robot_localization_repositories
}
