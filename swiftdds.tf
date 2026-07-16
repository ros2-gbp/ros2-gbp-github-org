locals {
  swiftdds_team = [
    "greenstonesoft",
  ]
  swiftdds_repositories = [
    "rmw_swiftdds-release",
  ]
}

module "swiftdds_team" {
  source       = "./modules/release_team"
  team_name    = "swiftdds"
  members      = local.swiftdds_team
  repositories = local.swiftdds_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
