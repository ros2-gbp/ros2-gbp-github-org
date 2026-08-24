locals {
  rainbow_robotics_team = [
    "gurbann",
    "wonmu1107",
  ]
  rainbow_robotics_repositories = [
    "rbq_ros2-release",
  ]
}

module "rainbow_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "rainbow_robotics"
  members      = local.rainbow_robotics_team
  repositories = local.rainbow_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
