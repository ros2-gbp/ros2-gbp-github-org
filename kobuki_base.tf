locals {
  kobuki_base_team = [
    "clalancette",
    "stonier",
  ]
  kobuki_base_repositories = [
    "kobuki_core-release",
    "kobuki_ros_interfaces-release",
    "kobuki_velocity_smoother-release",
  ]
}

module "kobuki_base_team" {
  source       = "./modules/release_team"
  team_name    = "kobuki_base"
  members      = local.kobuki_base_team
  repositories = local.kobuki_base_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
