locals {
  better_launch_team = [
    "ndahn",
  ]
  better_launch_repositories = [
    "better_launch-release",
  ]
}

module "better_launch_team" {
  source       = "./modules/release_team"
  team_name    = "better_launch"
  members      = local.better_launch_team
  repositories = local.better_launch_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
