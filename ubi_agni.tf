locals {
  ubi_agni_team = [
    "rhaschke",
  ]
  ubi_agni_repositories = [
    "agni_tf_tools-release",
  ]
}

module "ubi_agni_team" {
  source       = "./modules/release_team"
  team_name    = "ubi_agni"
  members      = local.ubi_agni_team
  repositories = local.ubi_agni_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
