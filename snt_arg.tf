locals {
  snt_arg_team = [
    "PedroS235",
    "hridaybavle",
  ]
  snt_arg_repositories = [
    "fast_gicp-release",
    "lidar_situational_graphs-release",
    "ndt_omp-release",
    "situational_graphs_dataset-release",
    "situational_graphs_msgs-release",
    "situational_graphs_reasoning-release",
    "situational_graphs_reasoning_msgs-release",
    "situational_graphs_wrapper-release",
    "unitree_ros-release",
  ]
}

module "snt_arg_team" {
  source       = "./modules/release_team"
  team_name    = "snt_arg"
  members      = local.snt_arg_team
  repositories = local.snt_arg_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
