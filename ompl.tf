locals {
  ompl_team = [
    "JafarAbdi",
    "MarqRazz",
    "mamoll",
    "yadunund",
  ]
  ompl_repositories = [
    "ompl-release",
  ]
}

module "ompl_team" {
  source       = "./modules/release_team"
  team_name    = "ompl"
  members      = local.ompl_team
  repositories = local.ompl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
