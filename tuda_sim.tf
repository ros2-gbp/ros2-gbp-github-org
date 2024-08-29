locals {
  tuda_sim_team = [
    "JoLichtenfeld",
    "Martin-Oehler",
    "StefanFabian",
  ]
  tuda_sim_repositories = [
    "hector_rviz_overlay-release",
    "qml_ros2_plugin-release",
    "ros_babel_fish-release",
  ]
}

module "tuda_sim_team" {
  source       = "./modules/release_team"
  team_name    = "tuda_sim"
  members      = local.tuda_sim_team
  repositories = local.tuda_sim_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
