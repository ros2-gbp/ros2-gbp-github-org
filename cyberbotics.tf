locals {
  cyberbotics_team = [
    "lukicdarkoo",
  ]
  cyberbotics_repositories = [
    "webots_ros2-release",
  ]
}

module "cyberbotics_team" {
  source = "./modules/release_team"
  team_name = "cyberbotics"
  members = local.cyberbotics_team
  repositories = local.cyberbotics_repositories
}
