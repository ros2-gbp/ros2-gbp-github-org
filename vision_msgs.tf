locals {
  vision_msgs_team = [
    "Kukanani",
  ]
  vision_msgs_repositories = [
    "vision_msgs-release",
  ]
}

module "vision_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "vision_msgs"
  members      = local.vision_msgs_team
  repositories = local.vision_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
