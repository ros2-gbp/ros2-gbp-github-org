locals {
  marine_msgs_team = [
    "lauralindzey",
    "rolker",
  ]
  marine_msgs_repositories = [
    "marine_msgs-release",
  ]
}

module "marine_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "marine_msgs"
  members      = local.marine_msgs_team
  repositories = local.marine_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
