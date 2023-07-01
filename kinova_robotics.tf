locals {
  kinova_robotics_team = [
    "felixmaisonneuve",
    "martinleroux",
    "moriarty",
  ]
  kinova_robotics_repositories = [
    "ros2_kortex-release",
  ]
}

module "kinova_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "kinova_robotics"
  members      = local.kinova_robotics_team
  repositories = local.kinova_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
