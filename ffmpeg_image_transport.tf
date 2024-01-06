locals {
  ffmpeg_image_transport_team = [
    "berndpfrommer",
  ]
  ffmpeg_image_transport_repositories = [
    "ffmpeg_image_transport-release",
    "ffmpeg_image_transport_msgs-release",
  ]
}

module "ffmpeg_image_transport_team" {
  source       = "./modules/release_team"
  team_name    = "ffmpeg_image_transport"
  members      = local.ffmpeg_image_transport_team
  repositories = local.ffmpeg_image_transport_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
