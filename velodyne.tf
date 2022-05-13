locals {
  velodyne_team = [
    "JWhitleyWork",
    "mikepurvis",
    "wjwwood",
  ]
  velodyne_repositories = [
    "velodyne-release",
  ]
}

module "velodyne_team" {
  source       = "./modules/release_team"
  team_name    = "velodyne"
  members      = local.velodyne_team
  repositories = local.velodyne_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}

