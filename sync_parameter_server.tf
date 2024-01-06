locals {
  sync_parameter_server_team = [
    "Tacha-S",
  ]
  sync_parameter_server_repositories = [
    "sync_parameter_server-release",
  ]
}

module "sync_parameter_server_team" {
  source       = "./modules/release_team"
  team_name    = "sync_parameter_server"
  members      = local.sync_parameter_server_team
  repositories = local.sync_parameter_server_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
