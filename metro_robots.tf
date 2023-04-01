locals {
  metro_robots_team = [
    "DLu",
  ]
  metro_robots_repositories = [
    "ros_system_fingerprint-release",
    "simple_actions-release",
  ]
}

module "metro_robots_team" {
  source       = "./modules/release_team"
  team_name    = "metro_robots"
  members      = local.metro_robots_team
  repositories = local.metro_robots_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
