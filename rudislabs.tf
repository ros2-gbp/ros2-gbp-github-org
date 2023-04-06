locals {
  rudislabs_team = [
    "bperseghetti",
  ]
  rudislabs_repositories = [
    "actuator_msgs-release",
  ]
}

module "rudislabs_team" {
  source       = "./modules/release_team"
  team_name    = "rudislabs"
  members      = local.rudislabs_team
  repositories = local.rudislabs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
