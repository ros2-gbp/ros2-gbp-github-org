locals {
  wirestead_team = [
    "jwsung91",
  ]
  wirestead_repositories = [
    "wirestead-release",
    "wirestead_ros-release",
  ]
}

module "wirestead_team" {
  source       = "./modules/release_team"
  team_name    = "wirestead"
  members      = local.wirestead_team
  repositories = local.wirestead_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
