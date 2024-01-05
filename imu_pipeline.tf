locals {
  imu_pipeline_team = [
    "mikeferguson",
  ]
  imu_pipeline_repositories = [
    "imu_pipeline-release",
  ]
}

module "imu_pipeline_team" {
  source       = "./modules/release_team"
  team_name    = "imu_pipeline"
  members      = local.imu_pipeline_team
  repositories = local.imu_pipeline_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
