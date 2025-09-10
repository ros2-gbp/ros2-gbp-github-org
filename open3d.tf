locals {
  open3d_team = [
    "christian-rauch",
  ]
  open3d_repositories = [
    "open3d_vendor-release",
  ]
}

module "open3d_team" {
  source       = "./modules/release_team"
  team_name    = "open3d"
  members      = local.open3d_team
  repositories = local.open3d_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
