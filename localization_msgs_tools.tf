locals {
  localization_msgs_tools_team = [
    "oKermorgant",
  ]
  localization_msgs_tools_repositories = [
    "localization_msgs_tools-release",
  ]
}

module "localization_msgs_tools_team" {
  source       = "./modules/release_team"
  team_name    = "localization_msgs_tools"
  members      = local.localization_msgs_tools_team
  repositories = local.localization_msgs_tools_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
