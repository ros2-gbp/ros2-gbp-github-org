locals {
  tsid_team = [
    "jcarpent",
    "wxmerkt",
    "nim65s",
    "olivier-stasse",
    "andreadelprete",
  ]
  tsid_repositories = [
    "tsid-release",
  ]
}

module "tsid_team" {
  source       = "./modules/release_team"
  team_name    = "tsid"
  members      = local.tsid_team
  repositories = local.tsid_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
