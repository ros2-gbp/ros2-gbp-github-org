locals {
  cognipilot_team = [
    "bperseghetti",
    "jgoppert",
  ]
  cognipilot_repositories = [
    "ros2_psutil-release",
    "ros2_psutil_msgs-release",
    "synapse_msgs-release",
  ]
}

module "cognipilot_team" {
  source       = "./modules/release_team"
  team_name    = "cognipilot"
  members      = local.cognipilot_team
  repositories = local.cognipilot_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
