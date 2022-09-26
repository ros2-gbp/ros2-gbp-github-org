locals {
  teamspatzenhirn_team = [
    "authaldo",
    "ottojo",
  ]
  teamspatzenhirn_repositories = [
    "rviz_2d_overlay_plugins-release",
  ]
}

module "teamspatzenhirn_team" {
  source       = "./modules/release_team"
  team_name    = "teamspatzenhirn"
  members      = local.teamspatzenhirn_team
  repositories = local.teamspatzenhirn_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
