locals {
  octomap_team = [
    "wxmerkt",
  ]
  octomap_repositories = [
    "octomap_msgs-release",
    "octomap_ros-release",
  ]
}

module "octomap_team" {
  source = "./modules/release_team"
  team_name = "octomap"
  members = local.octomap_team
  repositories = local.octomap_repositories
}
