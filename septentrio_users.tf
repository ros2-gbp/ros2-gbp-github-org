locals {
  septentrio_users_team = [
    "septentrio-users",
    "tibordome",
  ]
  septentrio_users_repositories = [
    "septentrio_gnss_driver_ros2-release",
  ]
}

module "septentrio_users_team" {
  source       = "./modules/release_team"
  team_name    = "septentrio_users"
  members      = local.septentrio_users_team
  repositories = local.septentrio_users_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
