locals {
  perception_team = [
    "SteveMacenski",
    "paulbovbel",
    "jonbinney",
  ]
  perception_repositories = [
    "laser_geometry-release",
    "pcl_msgs-release",
    "perception_pcl-release",
    "pointcloud_to_laserscan-release",
    "radar_msgs-release",
  ]
}

module "perception_team" {
  source = "./modules/release_team"
  team_name = "perception"
  members = local.perception_team
  repositories = local.perception_repositories
}
