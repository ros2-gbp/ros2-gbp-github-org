locals {
  picknik_team = [
    "DLu",
    "JafarAbdi",
    "davetcoleman",
    "tylerjw",
  ]
  picknik_repositories = [
    "graph_msgs-release",
    "launch_param_builder-release",
    "picknik_ament_copyright-release",
    "rviz_visual_tools-release",
    "snowbot_release",
  ]
}

module "picknik_team" {
  source       = "./modules/release_team"
  team_name    = "picknik"
  members      = local.picknik_team
  repositories = local.picknik_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
