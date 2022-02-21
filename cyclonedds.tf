locals {
  cyclonedds_team = [
    "eboasson",
    "JWhitleyWork",
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
}
