locals {
  imu_tools_team = [
    "mintar",
  ]
  imu_tools_repositories = [
    "imu_tools-release",
  ]
}

module "imu_tools_team" {
  source       = "./modules/release_team"
  team_name    = "imu_tools"
  members      = local.imu_tools_team
  repositories = local.imu_tools_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
