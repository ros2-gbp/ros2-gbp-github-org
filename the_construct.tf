locals {
  the_construct_team = [
    "rfzeg",
  ]
  the_construct_repositories = [
    "wall_follower_ros2-release",
  ]
}

module "the_construct_team" {
  source       = "./modules/release_team"
  team_name    = "the_construct"
  members      = local.the_construct_team
  repositories = local.the_construct_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
