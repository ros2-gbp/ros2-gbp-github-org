locals {
  b_robotized_team = [
    "Nibanovic",
  ]
  b_robotized_repositories = [
    "ads_vendor-release",
    "beckhoff_ads_driver-release",
  ]
}

module "b_robotized_team" {
  source       = "./modules/release_team"
  team_name    = "b_robotized"
  members      = local.b_robotized_team
  repositories = local.b_robotized_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
