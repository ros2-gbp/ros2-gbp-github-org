locals {
  ouster_drivers_team = [
    "SteveMacenski",
  ]
  ouster_drivers_repositories = [
    "ros2_ouster_drivers-release",
  ]
}

module "ouster_drivers_team" {
  source       = "./modules/release_team"
  team_name    = "ouster_drivers"
  members      = local.ouster_drivers_team
  repositories = local.ouster_drivers_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
