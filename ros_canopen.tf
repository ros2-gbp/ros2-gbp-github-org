locals {
  ros_canopen_team = [
    "mathias-luedtke",
  ]
  ros_canopen_repositories = [
    "ros_canopen-release",
  ]
}

module "ros_canopen_team" {
  source       = "./modules/release_team"
  team_name    = "ros_canopen"
  members      = local.ros_canopen_team
  repositories = local.ros_canopen_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
