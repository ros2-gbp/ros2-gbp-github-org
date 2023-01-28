locals {
  tuw_robotics_team = [
    "maxbader",
  ]
  tuw_robotics_repositories = [
    "marker_msgs-release",
    "marker_rviz_plugin-release",
    "tuw_msgs-release",
  ]
}

module "tuw_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "tuw_robotics"
  members      = local.tuw_robotics_team
  repositories = local.tuw_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
