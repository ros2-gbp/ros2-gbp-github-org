locals {
  tri_team = [
    "ahcorde",
    "caguero",
  ]
  tri_repositories = [
    "rqt_gauges-release",
  ]
}

module "tri_team" {
  source       = "./modules/release_team"
  team_name    = "tri"
  members      = local.tri_team
  repositories = local.tri_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
