locals {
  mavlink_team = [
    "vooon",
  ]
  mavlink_repositories = [
    "mavlink-gbp-release",
    "mavros-release",
  ]
}

module "mavlink_team" {
  source       = "./modules/release_team"
  team_name    = "mavlink"
  members      = local.mavlink_team
  repositories = local.mavlink_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
