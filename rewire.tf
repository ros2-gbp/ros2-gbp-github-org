locals {
  rewire_team = [
    "alvgaona",
  ]
  rewire_repositories = [
    "rewire_ros-release",
  ]
}

module "rewire_team" {
  source       = "./modules/release_team"
  team_name    = "rewire"
  members      = local.rewire_team
  repositories = local.rewire_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
