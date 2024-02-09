locals {
  robotont_team = [
    "Veix123",
    "Zhven",
  ]
  robotont_repositories = [
    "robotont_driver-release",
  ]
}

module "robotont_team" {
  source       = "./modules/release_team"
  team_name    = "robotont"
  members      = local.robotont_team
  repositories = local.robotont_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
