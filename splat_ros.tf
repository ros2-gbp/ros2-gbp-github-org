locals {
  splat_ros_team = [
    "adyy98",
    "AKC141096",
    "suchetanrs",
    "videh25",
  ]
  splat_ros_repositories = [
    "rviz_splat-release",
  ]
}

module "splat_ros_team" {
  source       = "./modules/release_team"
  team_name    = "splat_ros"
  members      = local.splat_ros_team
  repositories = local.splat_ros_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
