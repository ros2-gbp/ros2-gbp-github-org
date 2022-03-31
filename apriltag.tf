locals {
  apriltag_team = [
    "mkrogius",
    "wxmerkt",
  ]
  apriltag_repositories = [
    "apriltag-release",
  ]
}

module "apriltag_team" {
  source       = "./modules/release_team"
  team_name    = "apriltag"
  members      = local.apriltag_team
  repositories = local.apriltag_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
