locals {
  four_wheel_steering_msgs_team = [
    "vincentrou",
  ]
  four_wheel_steering_msgs_repositories = [
    "four_wheel_steering_msgs-release",
  ]
}

module "four_wheel_steering_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "four_wheel_steering_msgs"
  members      = local.four_wheel_steering_msgs_team
  repositories = local.four_wheel_steering_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
