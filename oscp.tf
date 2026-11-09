locals {
  oscp_team = [
    "BlueMazer",
  ]
  oscp_repositories = [
    "oscp_ros2_driver-release",
  ]
}

module "oscp_team" {
  source       = "./modules/release_team"
  team_name    = "oscp"
  members      = local.oscp_team
  repositories = local.oscp_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
