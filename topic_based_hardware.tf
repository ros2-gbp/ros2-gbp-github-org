locals {
  topic_based_hardware_team = [
    "bmagyar",
    "JafarAbdi",
    "MarqRazz",
  ]
  topic_based_hardware_repositories = [
    "topic_based_hardware-release",
  ]
}

module "topic_based_hardware_team" {
  source       = "./modules/release_team"
  team_name    = "topic_based_hardware"
  members      = local.topic_based_hardware_team
  repositories = local.topic_based_hardware_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
