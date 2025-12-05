locals {
  px4_team = [
    "mrpollo",
  ]
  px4_repositories = [
    "px4_msgs-release",
  ]
}

module "px4_team" {
  source       = "./modules/release_team"
  team_name    = "px4"
  members      = local.px4_team
  repositories = local.px4_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
