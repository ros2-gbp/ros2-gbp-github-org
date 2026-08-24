locals {
  wasp_research_group_team = [
    "MFernandezCarmona",
    "ajtudela",
  ]
  wasp_research_group_repositories = [
    "laser_segmentation-release",
    "rqt_lifecycle_manager-release",
    "sicks300_ros2-release",
    "slg_msgs-release",
  ]
}

module "wasp_research_group_team" {
  source       = "./modules/release_team"
  team_name    = "wasp_research_group"
  members      = local.wasp_research_group_team
  repositories = local.wasp_research_group_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
