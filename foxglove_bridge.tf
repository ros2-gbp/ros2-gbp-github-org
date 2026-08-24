locals {
  foxglove_bridge_team = [
    "achim-k",
    "Avan1ko",
    "bennetthardwick",
    "clalancette",
    "defunctzombie",
    "ericmlujan",
    "gasmith",
    "james-rms",
    "jnastaskin-foxglove",
    "jtbandes",
    "tom-foxglove",
  ]
  foxglove_bridge_repositories = [
    "foxglove_bridge-release",
  ]
}

module "foxglove_bridge_team" {
  source       = "./modules/release_team"
  team_name    = "foxglove_bridge"
  members      = local.foxglove_bridge_team
  repositories = local.foxglove_bridge_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
