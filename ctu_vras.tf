locals {
  ctu_vras_team = [
    "peci1",
  ]
  ctu_vras_repositories = [
    "compass-release",
    "cras_msgs-release",
    "cras_ros_utils-release",
    "robot_body_filter-release",
    "sensor_filters-release",
  ]
}

module "ctu_vras_team" {
  source       = "./modules/release_team"
  team_name    = "ctu_vras"
  members      = local.ctu_vras_team
  repositories = local.ctu_vras_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
