locals {
  picknik_team = [
    "DLu",
    "JafarAbdi",
    "davetcoleman",
  ]
  picknik_repositories = [
    "graph_msgs-release",
    "launch_ros_param_builder-release",
    "rviz_visual_tools-release",
    "snowbot_release",
  ]
}

module "picknik_team" {
  source = "./modules/release_team"
  team_name = "picknik"
  members = local.picknik_team
  repositories = local.picknik_repositories
}
