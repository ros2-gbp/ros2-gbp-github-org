locals {
  ouster_team = [
    "Samahu",
  ]
  ouster_repositories = [
    "ouster-ros-release",
  ]
}

module "ouster_team" {
  source       = "./modules/release_team"
  team_name    = "ouster"
  members      = local.ouster_team
  repositories = local.ouster_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
