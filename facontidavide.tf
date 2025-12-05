locals {
  facontidavide_team = [
    "facontidavide",
  ]
  facontidavide_repositories = [
    "cloudini-release",
  ]
}

module "facontidavide_team" {
  source       = "./modules/release_team"
  team_name    = "facontidavide"
  members      = local.facontidavide_team
  repositories = local.facontidavide_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
