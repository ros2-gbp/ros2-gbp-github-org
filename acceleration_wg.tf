locals {
  acceleration_wg_team = [
    "methylDragon",
    "vmayoral",
  ]
  acceleration_wg_repositories = [
    "adaptive_component-release",
    "ament_acceleration-release",
    "ament_vitis-release",
    "ros2acceleration-release",
    "tracetools_acceleration-release",
    "vitis_common-release",
  ]
}

module "acceleration_wg_team" {
  source       = "./modules/release_team"
  team_name    = "acceleration_wg"
  members      = local.acceleration_wg_team
  repositories = local.acceleration_wg_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
