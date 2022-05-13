locals {
  slider_publisher_team = [
    "oKermorgant",
  ]
  slider_publisher_repositories = [
    "slider_publisher-release",
  ]
}

module "slider_publisher_team" {
  source       = "./modules/release_team"
  team_name    = "slider_publisher"
  members      = local.slider_publisher_team
  repositories = local.slider_publisher_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
