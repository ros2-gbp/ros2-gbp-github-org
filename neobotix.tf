locals {
  neobotix_team = [
    "padhupradeep",
  ]
  neobotix_repositories = [
    "neo_simulation2-release",
  ]
}

module "neobotix_team" {
  source = "./modules/release_team"
  team_name = "neobotix"
  members = local.neobotix_team
  repositories = local.neobotix_repositories
}
