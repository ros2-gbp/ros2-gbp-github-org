locals {
  wasp_research_group_team = [
    "ajtudela",
  ]
  wasp_research_group_repositories = [
    "sicks300_ros2-release",
  ]
}

module "wasp_research_group_team" {
  source       = "./modules/release_team"
  team_name    = "wasp_research_group"
  members      = local.wasp_research_group_team
  repositories = local.wasp_research_group_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
