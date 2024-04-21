locals {
  misc_utilities_team = [
    "berndpfrommer",
  ]
  misc_utilities_repositories = [
    "apriltag_detector-release",
    "apriltag_mit-release",
    "ffmpeg_image_transport-release",
    "ffmpeg_image_transport_msgs-release",
    "ffmpeg_image_transport_tools-release",
  ]
}

module "misc_utilities_team" {
  source       = "./modules/release_team"
  team_name    = "misc_utilities"
  members      = local.misc_utilities_team
  repositories = local.misc_utilities_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
