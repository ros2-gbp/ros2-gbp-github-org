locals {
  foxglove_msgs_team = [
    "jhurliman",
    "wep21"
  ]
  foxglove_msgs_repositories = [
    "ros_foxglove_msgs-release",
  ]
}

module "foxglove_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "foxglove_msgs"
  members      = local.foxglove_msgs_team
  repositories = local.foxglove_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
