locals {
  octomap_team = [
    "ahornung",
    "wxmerkt",
  ]
  octomap_repositories = [
    "octomap-release",
    "octomap_mapping-release",
    "octomap_msgs-release",
    "octomap_ros-release",
    "octomap_rviz_plugins-release",
  ]
}

module "octomap_team" {
  source       = "./modules/release_team"
  team_name    = "octomap"
  members      = local.octomap_team
  repositories = local.octomap_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
