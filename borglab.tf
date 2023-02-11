locals {
  borglab_team = [
    "ProfFan",
    "jlblancoc",
  ]
  borglab_repositories = [
    "gtsam-release",
  ]
}

module "borglab_team" {
  source       = "./modules/release_team"
  team_name    = "borglab"
  members      = local.borglab_team
  repositories = local.borglab_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
