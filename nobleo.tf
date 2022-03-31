locals {
  nobleo_team = [
    "Timple",
  ]
  nobleo_repositories = [
    "libnabo-release",
    "libpointmatcher-release",
  ]
}

module "nobleo_team" {
  source       = "./modules/release_team"
  team_name    = "nobleo"
  members      = local.nobleo_team
  repositories = local.nobleo_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
