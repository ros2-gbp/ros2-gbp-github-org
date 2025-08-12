locals {
  ikerlan_ker_team = [
    "agonzat",
    "pep248",
  ]
  ikerlan_ker_repositories = [
    "extrinsic_calibrator-release",
  ]
}

module "ikerlan_ker_team" {
  source       = "./modules/release_team"
  team_name    = "ikerlan_ker"
  members      = local.ikerlan_ker_team
  repositories = local.ikerlan_ker_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
