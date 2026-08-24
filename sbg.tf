locals {
  sbg_team = [
    "tolesam",
  ]
  sbg_repositories = [
    "sbg_ros2-release",
  ]
}

module "sbg_team" {
  source       = "./modules/release_team"
  team_name    = "sbg"
  members      = local.sbg_team
  repositories = local.sbg_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
