locals {
  _42dot_team = [
    "huchijwk",
  ]
  _42dot_repositories = [
    "42dot-release",
  ]
}

module "_42dot_team" {
  source       = "./modules/release_team"
  team_name    = "42dot"
  members      = local._42dot_team
  repositories = local._42dot_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
