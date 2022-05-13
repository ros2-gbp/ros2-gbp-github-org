locals {
  geographic_info_team = [
    "SteveMacenski",
  ]
  geographic_info_repositories = [
    "geographic_info-release",
  ]
}

module "geographic_info_team" {
  source       = "./modules/release_team"
  team_name    = "geographic_info"
  members      = local.geographic_info_team
  repositories = local.geographic_info_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
