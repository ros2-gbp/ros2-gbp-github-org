locals {
  crocoddyl_team = [
    "cmastalli",
    "jcarpent",
    "nim65s",
    "olivier-stasse",
    "wxmerkt",
  ]
  crocoddyl_repositories = [
    "crocoddyl-release",
  ]
}

module "crocoddyl_team" {
  source       = "./modules/release_team"
  team_name    = "crocoddyl"
  members      = local.crocoddyl_team
  repositories = local.crocoddyl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
