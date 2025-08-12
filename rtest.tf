locals {
  rtest_team = [
    "MariuszSzczepanikSpyrosoft",
    "slci",
  ]
  rtest_repositories = [
    "rtest-release",
  ]
}

module "rtest_team" {
  source       = "./modules/release_team"
  team_name    = "rtest"
  members      = local.rtest_team
  repositories = local.rtest_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
