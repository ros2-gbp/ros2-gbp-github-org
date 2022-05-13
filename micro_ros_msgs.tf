locals {
  micro_ros_msgs_team = [
    "pablogs9",
  ]
  micro_ros_msgs_repositories = [
    "micro_ros_msgs-release",
  ]
}

module "micro_ros_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "micro_ros_msgs"
  members      = local.micro_ros_msgs_team
  repositories = local.micro_ros_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
