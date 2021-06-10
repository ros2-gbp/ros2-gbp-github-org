locals {
  xacro_team = [
    "codebot",
    "rhaschke",
  ]
  xacro_repositories = [
    "xacro-release",
  ]
}

module "xacro_team" {
  source = "./modules/release_team"
  team_name = "xacro"
  members = local.xacro_team
  repositories = local.xacro_team
}
