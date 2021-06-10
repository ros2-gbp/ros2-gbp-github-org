locals {
  ros_canopen_team = [
    "ipa-mdl",
  ]
  ros_canopen_repositories = [
    "ros_canopen-release",
  ]
}

module "ros_canopen_team" {
  source = "./modules/release_team"
  team_name = "ros_canopen"
  members = local.ros_canopen_team
  repositories = local.ros_canopen_team
}
