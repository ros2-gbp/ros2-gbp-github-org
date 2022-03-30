locals {
  mrpt2_team = [
    "jlblancoc",
    "jolting",
  ]
  mrpt2_repositories = [
    "mprt_navigation-release",
    "mprt_sensors-release",
    "mprt_slam-release",
    "mrpt2-release",
    "mrpt_msgs-release",
    "pose_cov_ops-release",
  ]
}

module "mrpt2_team" {
  source       = "./modules/release_team"
  team_name    = "mrpt2"
  members      = local.mrpt2_team
  repositories = local.mrpt2_repositories
}
