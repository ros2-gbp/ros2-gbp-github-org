locals {
  ardrone_sdk_team = [
    "vtalpaert",
  ]
  ardrone_sdk_repositories = [
    "ardrone_ros-release",
  ]
}

module "ardrone_sdk_team" {
  source       = "./modules/release_team"
  team_name    = "ardrone_sdk"
  members      = local.ardrone_sdk_team
  repositories = local.ardrone_sdk_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
