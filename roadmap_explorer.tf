locals {
  roadmap_explorer_team = [
    "suchetanrs",
  ]
  roadmap_explorer_repositories = [
    "roadmap_explorer-release",
  ]
}

module "roadmap_explorer_team" {
  source       = "./modules/release_team"
  team_name    = "roadmap_explorer"
  members      = local.roadmap_explorer_team
  repositories = local.roadmap_explorer_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
