locals {
  ros_event_camera_team = [
    "berndpfrommer",
    "k-chaney",
  ]
  ros_event_camera_repositories = [
    "event_camera_codecs-release",
    "event_camera_msgs-release",
    "event_camera_py-release",
    "event_camera_renderer-release",
    "libcaer_driver-release",
    "libcaer_vendor-release",
    "metavision_driver-release",
  ]
}

module "ros_event_camera_team" {
  source       = "./modules/release_team"
  team_name    = "ros_event_camera"
  members      = local.ros_event_camera_team
  repositories = local.ros_event_camera_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
