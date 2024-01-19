locals {
  vision_team = [
    "JWhitleyWork",
    "ahcorde",
    "mikeferguson",
  ]
  vision_repositories = [
    "image_pipeline-release",
  ]
}

module "vision_team" {
  source       = "./modules/release_team"
  team_name    = "vision"
  members      = local.vision_team
  repositories = local.vision_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
