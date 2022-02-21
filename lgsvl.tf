locals {
  lgsvl_team = [
    "daviduhm",
  ]
  lgsvl_repositories = [
    "lgsvl_msgs-release",
  ]
}

module "lgsvl_team" {
  source       = "./modules/release_team"
  team_name    = "lgsvl"
  members      = local.lgsvl_team
  repositories = local.lgsvl_repositories
}
