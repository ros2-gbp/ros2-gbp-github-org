locals {
  ess_imu_driver2_team = [
    "cubicleguy",
  ]
  ess_imu_driver2_repositories = [
    "ess_imu_driver2-release",
  ]
}

module "ess_imu_driver2_team" {
  source       = "./modules/release_team"
  team_name    = "ess_imu_driver2"
  members      = local.ess_imu_driver2_team
  repositories = local.ess_imu_driver2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
