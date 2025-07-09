locals {
  reductstore_team = [
    "AnthonyCvn",
    "atimin",
  ]
  reductstore_repositories = [
    "reductstore_agent-release",
  ]
}

module "reductstore_team" {
  source       = "./modules/release_team"
  team_name    = "reductstore"
  members      = local.reductstore_team
  repositories = local.reductstore_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
