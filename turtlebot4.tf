locals {
  turtlebot4_team = [
    "roni-kreinin",
    "tonybaltovski",
    "tfoote",
    "kscottz",
  ]
  turtlebot4_repositories = [
    "turtlebot4-release",
    "turtlebot4_desktop-release",
    "turtlebot4_robot-release",
    "turtlebot4_simulator-release",
  ]
}

module "turtlebot4_team" {
  source       = "./modules/release_team"
  team_name    = "turtlebot4"
  members      = local.turtlebot4_team
  repositories = local.turtlebot4_repositories
}
