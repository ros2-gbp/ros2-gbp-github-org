locals {
  navigation_team = [
    "JWhitleyWork",
    "SteveMacenski",
  ]
  navigation_repositories = [
    "image_pipeline-release",
    "navigation2-release",
  ]
}

module "navigation_team" {
  source = "./modules/release_team"
  team_name = "navigation"
  members = local.navigation_team
  repositories = local.navigation_repositories
}
