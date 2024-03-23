locals {
  cyclonedds_team = [
    "JWhitleyWork",
    "eboasson",
  ]
  cyclonedds_repositories = [
    "cyclonedds-release",
    "rmw_cyclonedds-release",
  ]
}

module "cyclonedds_team" {
  source       = "./modules/release_team"
  team_name    = "cyclonedds"
  members      = local.cyclonedds_team
  repositories = local.cyclonedds_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
