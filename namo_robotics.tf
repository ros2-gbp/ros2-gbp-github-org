locals {
  namo_robotics_team = [
    "david-wb",
  ]
  namo_robotics_repositories = [
    "aruco_markers-release",
  ]
}

module "namo_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "namo_robotics"
  members      = local.namo_robotics_team
  repositories = local.namo_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
