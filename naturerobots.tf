locals {
  naturerobots_team = [
    "amock",
  ]
  naturerobots_repositories = [
    "move_base_flex-release",
  ]
}

module "naturerobots_team" {
  source       = "./modules/release_team"
  team_name    = "naturerobots"
  members      = local.naturerobots_team
  repositories = local.naturerobots_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
