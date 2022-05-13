locals {
  gscam_team = [
    "jbohren",
    "wep21",
  ]
  gscam_repositories = [
    "gscam-release",
  ]
}

module "gscam_team" {
  source       = "./modules/release_team"
  team_name    = "gscam"
  members      = local.gscam_team
  repositories = local.gscam_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
