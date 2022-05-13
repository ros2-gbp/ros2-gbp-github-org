locals {
  lanelet2_team = [
    "poggenhans",
  ]
  lanelet2_repositories = [
    "lanelet2-release",
  ]
}

module "lanelet2_team" {
  source       = "./modules/release_team"
  team_name    = "lanelet2"
  members      = local.lanelet2_team
  repositories = local.lanelet2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
