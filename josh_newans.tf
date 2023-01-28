locals {
  josh_newans_team = [
    "joshnewans",
  ]
  josh_newans_repositories = [
    "joy_tester-release",
    "twist_stamper-release",
  ]
}

module "josh_newans_team" {
  source       = "./modules/release_team"
  team_name    = "josh_newans"
  members      = local.josh_newans_team
  repositories = local.josh_newans_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
