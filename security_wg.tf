locals {
  security_wg_team = [
    "jacobperron",
    "kyrofa",
  ]
  security_wg_repositories = [
    "sros2-release",
  ]
}

module "security_wg_team" {
  source       = "./modules/release_team"
  team_name    = "security_wg"
  members      = local.security_wg_team
  repositories = local.security_wg_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
