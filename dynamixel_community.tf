locals {
  dynamixel_community_team = [
    "ijnek",
    "youtalk",
  ]
  dynamixel_community_repositories = [
    "dynamixel_hardware-release",
  ]
}

module "dynamixel_community_team" {
  source       = "./modules/release_team"
  team_name    = "dynamixel_community"
  members      = local.dynamixel_community_team
  repositories = local.dynamixel_community_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
