locals {
  vrpn_team = [
    "alvinsunyixiao",
  ]
  vrpn_repositories = [
    "vrpn-release",
    "vrpn_mocap-release",
  ]
}

module "vrpn_team" {
  source       = "./modules/release_team"
  team_name    = "vrpn"
  members      = local.vrpn_team
  repositories = local.vrpn_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}

