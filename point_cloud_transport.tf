locals {
  point_cloud_transport_team = [
    "ahcorde",
    "john-maidbot"
  ]
  point_cloud_transport_repositories = [
    "point_cloud_transport-release",
    "point_cloud_transport_plugins-release",
    "point_cloud_transport_tutorial-release",
  ]
}

module "point_cloud_transport_team" {
  source       = "./modules/release_team"
  team_name    = "point_cloud_transport"
  members      = local.point_cloud_transport_team
  repositories = local.point_cloud_transport_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
