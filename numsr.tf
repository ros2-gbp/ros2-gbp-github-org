locals {
  numsr_team = [
    "hang-yin",
    "m-elwin",
    "ngmor",
  ]
  numsr_repositories = [
    "catch_ros2-release",
  ]
}

module "numsr_team" {
  source       = "./modules/release_team"
  team_name    = "numsr"
  members      = local.numsr_team
  repositories = local.numsr_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
