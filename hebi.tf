locals {
  hebi_team = [
    "cwbollinger",
    "hr1799",
  ]
  hebi_repositories = [
    "hebi_cpp_api-release",
  ]
}

module "hebi_team" {
  source       = "./modules/release_team"
  team_name    = "hebi"
  members      = local.hebi_team
  repositories = local.hebi_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
