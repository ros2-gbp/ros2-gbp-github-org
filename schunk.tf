locals {
  schunk_team = [
    "harry-arnst",
    "stefanscherzinger",
  ]
  schunk_repositories = [
    "schunk_svh_library-release",
    "schunk_svh_ros_driver-release",
  ]
}

module "schunk_team" {
  source       = "./modules/release_team"
  team_name    = "schunk"
  members      = local.schunk_team
  repositories = local.schunk_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
