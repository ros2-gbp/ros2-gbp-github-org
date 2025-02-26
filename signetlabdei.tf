locals {
  signetlabdei_team = [
    "dcostan",
  ]
  signetlabdei_repositories = [
    "rmw_desert-release",
  ]
}

module "signetlabdei_team" {
  source       = "./modules/release_team"
  team_name    = "signetlabdei"
  members      = local.signetlabdei_team
  repositories = local.signetlabdei_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
