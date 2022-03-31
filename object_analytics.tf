locals {
  object_analytics_team = [
  ]
  object_analytics_repositories = [
    "ros2_object_analytics-release",
    "ros2_object_msgs-release",
  ]
}

module "object_analytics_team" {
  source       = "./modules/release_team"
  team_name    = "object_analytics"
  members      = local.object_analytics_team
  repositories = local.object_analytics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
