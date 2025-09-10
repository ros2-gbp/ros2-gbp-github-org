locals {
  pymoveit_team = [
    "AndrejOrsula",
    "christian-rauch",
  ]
  pymoveit_repositories = [
    "pymoveit2-release",
  ]
}

module "pymoveit_team" {
  source       = "./modules/release_team"
  team_name    = "pymoveit"
  members      = local.pymoveit_team
  repositories = local.pymoveit_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
