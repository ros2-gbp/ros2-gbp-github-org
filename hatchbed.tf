locals {
  hatchbed_team = [
    "malban",
    "pjreed",
  ]
  hatchbed_repositories = [
    "asyncapi_gencpp-release",
    "hatchbed_common-release",
    "log_view-release",
    "opensw-release",
    "opensw_ros-release",
  ]
}

module "hatchbed_team" {
  source       = "./modules/release_team"
  team_name    = "hatchbed"
  members      = local.hatchbed_team
  repositories = local.hatchbed_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
