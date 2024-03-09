locals {
  filters_team = [
    "jonbinney",
    "tfoote",
  ]
  filters_repositories = [
    "filters-release",
  ]
}

module "filters_team" {
  source       = "./modules/release_team"
  team_name    = "filters"
  members      = local.filters_team
  repositories = local.filters_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
