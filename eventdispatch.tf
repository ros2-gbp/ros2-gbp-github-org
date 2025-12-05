locals {
  eventdispatch_team = [
    "cyan-at",
  ]
  eventdispatch_repositories = [
    "ros2_eventdispatch-release",
  ]
}

module "eventdispatch_team" {
  source       = "./modules/release_team"
  team_name    = "eventdispatch"
  members      = local.eventdispatch_team
  repositories = local.eventdispatch_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
