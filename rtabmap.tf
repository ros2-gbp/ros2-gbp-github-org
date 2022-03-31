locals {
  rtabmap_team = [
    "matlabbe",
  ]
  rtabmap_repositories = [
    "rtabmap-release",
  ]
}

module "rtabmap_team" {
  source       = "./modules/release_team"
  team_name    = "rtabmap"
  members      = local.rtabmap_team
  repositories = local.rtabmap_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
