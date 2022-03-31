locals {
  micro_ros_diagnostics_team = [
    "bjv-capra",
    "norro",
    "ralph-lange",
  ]
  micro_ros_diagnostics_repositories = [
    "micro_ros_diagnostics-release",
  ]
}

module "micro_ros_diagnostics_team" {
  source       = "./modules/release_team"
  team_name    = "micro_ros_diagnostics"
  members      = local.micro_ros_diagnostics_team
  repositories = local.micro_ros_diagnostics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
