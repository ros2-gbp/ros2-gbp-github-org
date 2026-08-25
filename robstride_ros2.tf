locals {
  robstride_ros2_team = [
    "s2015-turtle",
  ]
  robstride_ros2_repositories = [
    "robstride_ros2-release",
  ]
}

module "robstride_ros2_team" {
  source       = "./modules/release_team"
  team_name    = "robstride_ros2"
  members      = local.robstride_ros2_team
  repositories = local.robstride_ros2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
