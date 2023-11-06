locals {
  mobile_message_service_generator_team = [
    "RonaldsonBellande",
  ]
  mobile_message_service_generator_repositories = [
    "mobile_message_service_generator-release",
  ]
}

module "mobile_message_service_generator_team" {
  source       = "./modules/release_team"
  team_name    = "mobile_message_service_generator"
  members      = local.mobile_message_service_generator_team
  repositories = local.mobile_message_service_generator_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
