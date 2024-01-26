locals {
  umdlife_team = [
    "biancabnd",
    "vicmassy",
  ]
  umdlife_repositories = [
    "psdk_ros2-release",
  ]
}

module "umdlife_team" {
  source       = "./modules/release_team"
  team_name    = "umdlife"
  members      = local.umdlife_team
  repositories = local.umdlife_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
