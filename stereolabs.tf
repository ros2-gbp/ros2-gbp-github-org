locals {
  stereolabs_team = [
    "Myzhar",
    "P-yver",
    "adujardin",
    "obraun-sl",
  ]
  stereolabs_repositories = [
    "zed-ros2-interfaces-release",
  ]
}

module "stereolabs_team" {
  source       = "./modules/release_team"
  team_name    = "stereolabs"
  members      = local.stereolabs_team
  repositories = local.stereolabs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
