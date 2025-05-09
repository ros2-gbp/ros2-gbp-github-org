locals {
  rai_team = [
    "adamdbrw",
    "knicked",
    "maciejmajek",
    "rachwalk",
  ]
  rai_repositories = [
    "rai_interfaces-release",
  ]
}

module "rai_team" {
  source       = "./modules/release_team"
  team_name    = "rai"
  members      = local.rai_team
  repositories = local.rai_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
