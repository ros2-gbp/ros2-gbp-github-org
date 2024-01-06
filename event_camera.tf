locals {
  event_camera_team = [
    "berndpfrommer",
  ]
  event_camera_repositories = [
    "libcaer-release",
  ]
}

module "event_camera_team" {
  source       = "./modules/release_team"
  team_name    = "event_camera"
  members      = local.event_camera_team
  repositories = local.event_camera_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
