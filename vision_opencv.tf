locals {
  vision_opencv_team = [
    "ijnek",
  ]
  vision_opencv_repositories = [
    "vision_opencv-release",
  ]
}

module "vision_opencv_team" {
  source       = "./modules/release_team"
  team_name    = "vision_opencv"
  members      = local.vision_opencv_team
  repositories = local.vision_opencv_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
