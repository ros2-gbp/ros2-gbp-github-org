locals {
  schunk_svh_team = [
    "harry-arnst",
    "stefanscherzinger",
  ]
  schunk_svh_repositories = [
    "schunk_svh_library-release",
    "schunk_svh_ros_driver-release",
  ]
}

module "schunk_svh_team" {
  source       = "./modules/release_team"
  team_name    = "schunk_svh"
  members      = local.schunk_svh_team
  repositories = local.schunk_svh_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
