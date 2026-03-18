locals {
  ros2_medkit_team = [
    "bburda",
    "mfaferek93",
  ]
  ros2_medkit_repositories = [
    "ros2_medkit-release",
  ]
}

module "ros2_medkit_team" {
  source       = "./modules/release_team"
  team_name    = "ros2_medkit"
  members      = local.ros2_medkit_team
  repositories = local.ros2_medkit_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
