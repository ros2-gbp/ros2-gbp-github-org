locals {
  turtlebot4_team = [
    "kscottz",
    "roni-kreinin",
    "tfoote",
    "tonybaltovski",
  ]
  turtlebot4_repositories = [
    "turtlebot4-release",
    "turtlebot4_desktop-release",
    "turtlebot4_examples-release",
    "turtlebot4_robot-release",
    "turtlebot4_simulator-release",
    "turtlebot4_tutorials-release",
  ]
}

module "turtlebot4_team" {
  source       = "./modules/release_team"
  team_name    = "turtlebot4"
  members      = local.turtlebot4_team
  repositories = local.turtlebot4_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
