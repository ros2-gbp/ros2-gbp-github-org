locals {
  robotraconteur_team = [
    "johnwason",
  ]
  robotraconteur_repositories = [
    "robotraconteur-release",
  ]
}

module "robotraconteur_team" {
  source       = "./modules/release_team"
  team_name    = "robotraconteur"
  members      = local.robotraconteur_team
  repositories = local.robotraconteur_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
