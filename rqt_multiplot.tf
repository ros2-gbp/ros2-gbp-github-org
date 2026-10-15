locals {
  rqt_multiplot_team = [
    "samuelba",
  ]
  rqt_multiplot_repositories = [
    "rqt_multiplot_plugin-release",
  ]
}

module "rqt_multiplot_team" {
  source       = "./modules/release_team"
  team_name    = "rqt_multiplot"
  members      = local.rqt_multiplot_team
  repositories = local.rqt_multiplot_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
