locals {
  mocap_optitrack_team = [
    "tonybaltovski",
  ]
  mocap_optitrack_repositories = [
    "mocap_optitrack-release",
  ]
}

module "mocap_optitrack_team" {
  source       = "./modules/release_team"
  team_name    = "mocap_optitrack"
  members      = local.mocap_optitrack_team
  repositories = local.mocap_optitrack_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
