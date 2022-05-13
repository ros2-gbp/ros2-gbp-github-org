locals {
  libg2o_team = [
    "croesmann",
  ]
  libg2o_repositories = [
    "libg2o-release",
  ]
}

module "libg2o_team" {
  source       = "./modules/release_team"
  team_name    = "libg2o"
  members      = local.libg2o_team
  repositories = local.libg2o_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
