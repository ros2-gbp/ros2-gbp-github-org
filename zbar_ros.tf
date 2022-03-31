locals {
  zbar_ros_team = [
    "ijnek",
    "mikepurvis",
    "paulbovbel",
  ]

  zbar_ros_repositories = [
    "zbar_ros-release",
  ]
}

module "zbar_ros_team" {
  source       = "./modules/release_team"
  team_name    = "zbar_ros"
  members      = local.zbar_ros_team
  repositories = local.zbar_ros_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
