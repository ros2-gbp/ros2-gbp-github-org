locals {
  andino_team = [
    "francocipollone",
    "jballoffet",
  ]
  andino_repositories = [
    "andino-release",
    "andino_gz-release",
  ]
}

module "andino_team" {
  source       = "./modules/release_team"
  team_name    = "andino"
  members      = local.andino_team
  repositories = local.andino_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
