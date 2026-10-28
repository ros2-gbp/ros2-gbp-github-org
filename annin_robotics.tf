locals {
  annin_robotics_team = [
    "Chris-Annin",
    "hksaperstein",
  ]
  annin_robotics_repositories = [
    "ar4_ros_driver-release",
  ]
}

module "annin_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "annin_robotics"
  members      = local.annin_robotics_team
  repositories = local.annin_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
