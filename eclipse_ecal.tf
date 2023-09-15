locals {
  eclipse_ecal_team = [
    "wep21",
  ]
  eclipse_ecal_repositories = [
    "ecal-release",
  ]
}

module "eclipse_ecal_team" {
  source       = "./modules/release_team"
  team_name    = "eclipse_ecal"
  members      = local.eclipse_ecal_team
  repositories = local.eclipse_ecal_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
