locals {
  image_transport_plugins_team = [
    "ijnek",
  ]
  image_transport_plugins_repositories = [
    "image_transport_plugins-release",
  ]
}

module "image_transport_plugins_team" {
  source       = "./modules/release_team"
  team_name    = "image_transport_plugins"
  members      = local.image_transport_plugins_team
  repositories = local.image_transport_plugins_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
