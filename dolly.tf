locals {
  dolly_team = [
    "chapulina",
  ]
  dolly_repositories = [
    "dolly-release",
  ]
}

module "dolly_team" {
  source       = "./modules/release_team"
  team_name    = "dolly"
  members      = local.dolly_team
  repositories = local.dolly_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
