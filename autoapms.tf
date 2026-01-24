locals {
  autoapms_team = [
    "robin-mueller",
  ]

  autoapms_repositories = [
    "autoapms-release",
  ]
}

module "autoapms_team" {
  source       = "./modules/release_team"
  team_name    = "autoapms"
  members      = local.autoapms_team
  repositories = local.autoapms_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
