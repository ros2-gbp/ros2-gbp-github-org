locals {
  fields2cover_team = [
    "Gonzalo-Mier",
  ]
  fields2cover_repositories = [
    "fields2cover-release",
  ]
}

module "fields2cover_team" {
  source       = "./modules/release_team"
  team_name    = "fields2cover"
  members      = local.fields2cover_team
  repositories = local.fields2cover_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
