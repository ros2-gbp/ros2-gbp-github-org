locals {
  simple_launch_team = [
    "oKermorgant",
  ]
  simple_launch_repositories = [
    "simple_launch-release",
  ]
}

module "simple_launch_team" {
  source       = "./modules/release_team"
  team_name    = "simple_launch"
  members      = local.simple_launch_team
  repositories = local.simple_launch_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
