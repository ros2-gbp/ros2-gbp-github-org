locals {
  fkie_team = [
    "atiderko",
    "roehling",
  ]
  fkie_repositories = [
    "fkie_message_filters-release",
  ]
}

module "fkie_team" {
  source       = "./modules/release_team"
  team_name    = "fkie"
  members      = local.fkie_team
  repositories = local.fkie_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
