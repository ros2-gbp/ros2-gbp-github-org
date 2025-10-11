locals {
  jrl_cmakemodules_team = [
    "jcarpent",
    "nim65s",
    "olivier-stasse",
    "wxmerkt",
  ]
  jrl_cmakemodules_repositories = [
    "jrl_cmakemodules-release",
  ]
}

module "jrl_cmakemodules_team" {
  source       = "./modules/release_team"
  team_name    = "jrl_cmakemodules"
  members      = local.jrl_cmakemodules_team
  repositories = local.jrl_cmakemodules_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
