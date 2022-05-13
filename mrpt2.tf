locals {
  mrpt2_team = [
    "jlblancoc",
    "jolting",
  ]
  mrpt2_repositories = [
    "mrpt2-release",
    "mrpt_msgs-release",
    "mrpt_navigation-release",
    "mrpt_sensors-release",
    "mrpt_slam-release",
    "pose_cov_ops-release",
  ]
}

module "mrpt2_team" {
  source       = "./modules/release_team"
  team_name    = "mrpt2"
  members      = local.mrpt2_team
  repositories = local.mrpt2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
