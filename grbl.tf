locals {
  grbl_team = [
    "flynneva",
  ]
  grbl_repositories = [
    "grbl_msgs-release",
    "grbl_ros-release",
  ]
}

module "grbl_team" {
  source       = "./modules/release_team"
  team_name    = "grbl"
  members      = local.grbl_team
  repositories = local.grbl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
