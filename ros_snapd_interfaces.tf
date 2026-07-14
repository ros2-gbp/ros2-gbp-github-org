locals {
  ros_snapd_interfaces_team = [
    "artivis",
    "Guillaumebeuzeboc",
    "MirkoFerrati",
  ]
  ros_snapd_interfaces_repositories = [
    "ros_snapd_interfaces-release",
  ]
}

module "ros_snapd_interfaces_team" {
  source       = "./modules/release_team"
  team_name    = "ros_snapd_interfaces"
  members      = local.ros_snapd_interfaces_team
  repositories = local.ros_snapd_interfaces_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
