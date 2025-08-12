locals {
  jafarabdi_team = [
    "JafarAbdi",
  ]

  jafarabdi_repositories = [
    "feetech_ros2_driver-release",
    "jacro-release",
  ]
}

module "jafarabdi_team" {
  source       = "./modules/release_team"
  team_name    = "jafarabdi"
  members      = local.jafarabdi_team
  repositories = local.jafarabdi_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
