locals {
  cascade_lifecycle_team = [
    "fmrico",
  ]
  cascade_lifecycle_repositories = [
    "cascade_lifecycle-release",
  ]
}

module "cascade_lifecycle_team" {
  source       = "./modules/release_team"
  team_name    = "cascade_lifecycle"
  members      = local.cascade_lifecycle_team
  repositories = local.cascade_lifecycle_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
