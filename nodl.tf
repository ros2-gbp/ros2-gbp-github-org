locals {
  nodl_team = [
    "Arnatious",
  ]
  nodl_repositories = [
    "ament_nodl-release",
    "nodl-release",
  ]
}

module "nodl_team" {
  source = "./modules/release_team"
  team_name = "nodl"
  members = local.nodl_team
  repositories = local.nodl_team
}
