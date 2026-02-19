locals {
  uos_team = [
    "amock",
    "JustusBraun",
  ]
  uos_repositories = [
    "lvr2-release",
  ]
}

module "uos_team" {
  source       = "./modules/release_team"
  team_name    = "uos"
  members      = local.uos_team
  repositories = local.uos_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
