locals {
  realsense_team = [
    "RachelRen05",
    "doronhi",
    "sharonliu",
    "yechun1",
  ]
  realsense_repositories = [
    "librealsense-release",
    "ros2_intel_realsense-release",
  ]
}

module "realsense_team" {
  source = "./modules/release_team"
  team_name = "realsense"
  members = local.realsense_team
  repositories = local.realsense_team
}
