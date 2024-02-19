locals {
  picknik_team = [
    "ChrisThrasher",
    "DLu",
    "JafarAbdi",
    "MarqRazz",
    "moriarty",
    "sea-bass",
    "sjahr",
    "tylerjw",
    "vatanaksoytezer",
  ]
  picknik_repositories = [
    "cpp_polyfills-release",
    "generate_parameter_library-release",
    "graph_msgs-release",
    "launch_param_builder-release",
    "pick_ik-release",
    "picknik_ament_copyright-release",
    "picknik_controllers-release",
    "ros2_robotiq_gripper-release",
    "rsl-release",
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
