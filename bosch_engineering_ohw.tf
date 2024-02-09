locals {
  bosch_engineering_ohw_team = [
    "daniel4ohw",
    "rcp1-beg",
    "shu-beg",
  ]
  bosch_engineering_ohw_repositories = [
    "off_highway_sensor_drivers-release",
  ]
}

module "bosch_engineering_ohw_team" {
  source       = "./modules/release_team"
  team_name    = "bosch_engineering_ohw"
  members      = local.bosch_engineering_ohw_team
  repositories = local.bosch_engineering_ohw_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
