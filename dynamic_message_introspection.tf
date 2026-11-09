locals {
  dynamic_message_introspection_team = [
    "christophebedard",
    "InvincibleRMC",
  ]
  dynamic_message_introspection_repositories = [
    "dynamic_message_introspection-release",
  ]
}

module "dynamic_message_introspection_team" {
  source       = "./modules/release_team"
  team_name    = "dynamic_message_introspection"
  members      = local.dynamic_message_introspection_team
  repositories = local.dynamic_message_introspection_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
