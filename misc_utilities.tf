locals {
  misc_utilities_team = [
    "berndpfrommer",
  ]
  misc_utilities_repositories = [
    "apriltag_detector-release",
  ]
}

module "misc_utilities_team" {
  source       = "./modules/release_team"
  team_name    = "misc_utilities"
  members      = local.misc_utilities_team
  repositories = local.misc_utilities_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
