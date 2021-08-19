locals {
  navigation_team = [
    "JWhitleyWork",
    "SteveMacenski",
    "paulbovbel",
  ]
  navigation_repositories = [
    "image_pipeline-release",
    "navigation-release",
    "navigation2-release",
    "navigation_msgs-release",
    "pcl_msgs-release",
  ]
}

module "navigation_team" {
  source = "./modules/release_team"
  team_name = "navigation"
  members = local.navigation_team
  repositories = local.navigation_repositories
}
