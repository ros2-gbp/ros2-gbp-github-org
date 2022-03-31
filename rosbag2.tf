locals {
  rosbag2_team = [
    "Karsten1987",
    "emersonknapp",
    "lihui815",
  ]

  rosbag2_repositories = [
    "rosbag2-release",
    "rosbag2_bag_v2-release",
  ]
}

module "rosbag2_team" {
  source       = "./modules/release_team"
  team_name    = "rosbag2"
  members      = local.rosbag2_team
  repositories = local.rosbag2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
