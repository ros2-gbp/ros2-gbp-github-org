locals {
  ros4hri_team = [
    "severin-lemaignan",
  ]
  ros4hri_repositories = [
    "hri_msgs-release",
  ]
}

module "ros4hri_team" {
  source       = "./modules/release_team"
  team_name    = "ros4hri"
  members      = local.ros4hri_team
  repositories = local.ros4hri_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
