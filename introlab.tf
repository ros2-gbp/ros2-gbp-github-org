locals {
  introlab_team = [
    "matlabbe",
  ]
  introlab_repositories = [
    "find_object_2d-release",
  ]
}

module "introlab_team" {
  source       = "./modules/release_team"
  team_name    = "introlab"
  members      = local.introlab_team
  repositories = local.introlab_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
