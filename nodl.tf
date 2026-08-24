locals {
  nodl_team = [
    "Arnatious",
    "alistair-english",
    "emersonknapp",
    "kyrofa",
    "lsy3",
  ]
  nodl_repositories = [
    "ament_nodl-release",
    "nodl-release",
  ]
}

module "nodl_team" {
  source       = "./modules/release_team"
  team_name    = "nodl"
  members      = local.nodl_team
  repositories = local.nodl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
