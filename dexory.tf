locals {
  dexory_team = [
    "nachovizzo",
  ]

  dexory_repositories = [
    "ament_black-release",
  ]
}

module "dexory" {
  source       = "./modules/release_team"
  team_name    = "dexory"
  members      = local.dexory_team
  repositories = local.dexory_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
