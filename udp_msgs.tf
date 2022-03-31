locals {
  udp_msgs_team = [
    "flynneva",
  ]
  udp_msgs_repositories = [
    "udp_msgs-release",
  ]
}

module "udp_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "udp_msgs"
  members      = local.udp_msgs_team
  repositories = local.udp_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
