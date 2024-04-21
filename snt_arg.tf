locals {
  snt_arg_team = [
    "PedroS235",
    "hridaybavle",
  ]
  snt_arg_repositories = [
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
