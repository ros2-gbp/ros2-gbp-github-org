locals {
  transport_drivers_team = [
    "JWhitleyWork",
  ]
  transport_drivers_repositories = [
    "transport_drivers-release",
  ]
}

module "transport_drivers_team" {
  source       = "./modules/release_team"
  team_name    = "transport_drivers"
  members      = local.transport_drivers_team
  repositories = local.transport_drivers_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
