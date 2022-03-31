locals {
  ruckig_team = [
    "pantor",
  ]
  ruckig_repositories = [
    "ruckig-release",
  ]
}

module "ruckig_team" {
  source       = "./modules/release_team"
  team_name    = "ruckig"
  members      = local.ruckig_team
  repositories = local.ruckig_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
