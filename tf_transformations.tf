locals {
  tf_transformations_team = [
    "DLu",
  ]
  tf_transformations_repositories = [
    "tf_transformations_release",
  ]
}

module "tf_transformations_team" {
  source       = "./modules/release_team"
  team_name    = "tf_transformations"
  members      = local.tf_transformations_team
  repositories = local.tf_transformations_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
