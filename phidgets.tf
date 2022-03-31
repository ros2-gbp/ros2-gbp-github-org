locals {
  phidgets_team = [
    "clalancette",
    "mintar",
  ]
  phidgets_repositories = [
    "phidgets_drivers-release",
  ]
}

module "phidgets_team" {
  source       = "./modules/release_team"
  team_name    = "phidgets"
  members      = local.phidgets_team
  repositories = local.phidgets_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
