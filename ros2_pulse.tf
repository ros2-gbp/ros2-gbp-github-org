locals {
  ros2_pulse_team = [
    "TanayK07",
  ]
  ros2_pulse_repositories = [
    "ros2_pulse-release",
  ]
}

module "ros2_pulse_team" {
  source       = "./modules/release_team"
  team_name    = "ros2_pulse"
  members      = local.ros2_pulse_team
  repositories = local.ros2_pulse_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
