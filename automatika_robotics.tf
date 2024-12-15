locals {
  automatika_robotics_team = [
    "aleph-ra",
    "mkabtoul",
  ]
  automatika_robotics_repositories = [
    "automatika_ros_sugar-release",
  ]
}

module "automatika_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "automatika_robotics"
  members      = local.automatika_robotics_team
  repositories = local.automatika_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
