locals {
  message_filters_team = [
  ]
  message_filters_repositories = [
    "ros2_message_filters-release",
  ]
}

module "message_filters_team" {
  source       = "./modules/release_team"
  team_name    = "message_filters"
  members      = local.message_filters_team
  repositories = local.message_filters_repositories
}
