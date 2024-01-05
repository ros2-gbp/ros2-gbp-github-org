locals {
  pangolin_team = [
    "christian-rauch",
  ]
  pangolin_repositories = [
    "Pangolin-release",
  ]
}

module "pangolin_team" {
  source       = "./modules/release_team"
  team_name    = "pangolin"
  members      = local.pangolin_team
  repositories = local.pangolin_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
