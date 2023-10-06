locals {
  flexbe_team = [
    "dcconner",
  ]
  flexbe_repositories = [
    "flexbe_app-release",
    "flexbe_behavior_engine-release",
  ]
}

module "flexbe_team" {
  source       = "./modules/release_team"
  team_name    = "flexbe"
  members      = local.flexbe_team
  repositories = local.flexbe_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
