locals {
  bno055_team = [
    "flynneva",
  ]
  bno055_repositories = [
    "bno055-release",
  ]
}

module "bno055_team" {
  source       = "./modules/release_team"
  team_name    = "bno055"
  members      = local.bno055_team
  repositories = local.bno055_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
