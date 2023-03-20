locals {
  gstavrinos_team = [
    "gstavrinos",
  ]
  gstavrinos_repositories = [
    "odom_to_tf_ros2-release",
  ]
}

module "gstavrinos_team" {
  source       = "./modules/release_team"
  team_name    = "gstavrinos"
  members      = local.gstavrinos_team
  repositories = local.gstavrinos_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
