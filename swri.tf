locals {
  swri_team = [
    "danthony06",
  ]
  swri_repositories = [
    "gps_umd-release",
    "mapviz-release",
    "marti_common-release",
    "marti_messages-release",
    "novatel_gps_driver-release",
    "swri_console-release",
  ]
}

module "swri_team" {
  source       = "./modules/release_team"
  team_name    = "swri"
  members      = local.swri_team
  repositories = local.swri_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
