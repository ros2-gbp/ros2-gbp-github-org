locals {
  ros2_snapshot_team = [
    "dcconner",
  ]
  ros2_snapshot_repositories = [
    "ros2_snapshot-release",
  ]
}

module "ros2_snapshot_team" {
  source       = "./modules/release_team"
  team_name    = "ros2_snapshot"
  members      = local.ros2_snapshot_team
  repositories = local.ros2_snapshot_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
