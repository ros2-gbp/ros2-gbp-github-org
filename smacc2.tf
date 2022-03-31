locals {
  smacc2_team = [
    "destogl",
  ]
  smacc2_repositories = [
    "SMACC2-release",
  ]
}

module "smacc2_team" {
  source       = "./modules/release_team"
  team_name    = "smacc2"
  members      = local.smacc2_team
  repositories = local.smacc2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
