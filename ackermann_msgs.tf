locals {
  ackermann_msgs_team = [
    "vincentrou",
  ]
  ackermann_msgs_repositories = [
    "ackermann_msgs-release",
  ]
}

module "ackermann_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "ackermann_msgs"
  members      = local.ackermann_msgs_team
  repositories = local.ackermann_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
