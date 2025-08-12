locals {
  niwcpac_team = [
    "denewiler",
    "gregtkogut",
    "xydesa",
  ]
  niwcpac_repositories = [
    "rqt_dotgraph-release",
  ]
}

module "niwcpac_team" {
  source       = "./modules/release_team"
  team_name    = "niwcpac"
  members      = local.niwcpac_team
  repositories = local.niwcpac_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
