locals {
  rosauth_team = [
    "reinzor",
  ]
  rosauth_repositories = [
    "rosauth-release",
  ]
}

module "rosauth_team" {
  source       = "./modules/release_team"
  team_name    = "rosauth"
  members      = local.rosauth_team
  repositories = local.rosauth_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
