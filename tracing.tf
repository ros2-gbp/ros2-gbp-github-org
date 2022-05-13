locals {
  tracing_team = [
    "christophebedard",
  ]
  tracing_repositories = [
    "ros2_tracing-release",
    "tracetools_analysis-release",
  ]
}

module "tracing_team" {
  source       = "./modules/release_team"
  team_name    = "tracing"
  members      = local.tracing_team
  repositories = local.tracing_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
