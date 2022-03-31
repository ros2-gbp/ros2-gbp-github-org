locals {
  perception_team = [
    "SteveMacenski",
    "jacobperron",
    "jonbinney",
    "paulbovbel",
  ]
  perception_repositories = [
    "laser_filters-release",
    "laser_geometry-release",
    "object_recognition_msgs-release",
    "pcl_msgs-release",
    "perception_pcl-release",
    "pointcloud_to_laserscan-release",
    "radar_msgs-release",
  ]
}

module "perception_team" {
  source       = "./modules/release_team"
  team_name    = "perception"
  members      = local.perception_team
  repositories = local.perception_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
