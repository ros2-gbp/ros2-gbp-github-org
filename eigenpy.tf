locals {
  eigenpy_team = [
    "jcarpent",
    "wxmerkt",
    "nim65s",
  ]
  eigenpy_repositories = [
    "eigenpy-release",
  ]
}

module "eigenpy_team" {
  source       = "./modules/release_team"
  team_name    = "eigenpy"
  members      = local.eigenpy_team
  repositories = local.eigenpy_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
