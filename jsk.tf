locals {
  jsk_team = [
    "k-okada",
  ]
  jsk_repositories = [
    "jsk_common_msgs-release",
  ]
}

module "jsk_team" {
  source       = "./modules/release_team"
  team_name    = "jsk"
  members      = local.jsk_team
  repositories = local.jsk_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
