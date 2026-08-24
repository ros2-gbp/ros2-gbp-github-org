locals {
  nodl_team = [
    "Arnatious",
    "kyrofa",
    "emersonknapp",
    "lsy3",
    "alistair-english",
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
