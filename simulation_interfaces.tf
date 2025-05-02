locals {
  simulation_interfaces_team = [
    "adamdbrw",
    "mjcarroll",
    "zakmat",
  ]
  simulation_interfaces_repositories = [
    "simulation_interfaces-release",
  ]
}

module "simulation_interfaces_team" {
  source       = "./modules/release_team"
  team_name    = "simulation_interfaces"
  members      = local.simulation_interfaces_team
  repositories = local.simulation_interfaces_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
