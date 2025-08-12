locals {
  chroma_team = [
    "david-wb",
    "jacques-saraydaryan",
  ]
  chroma_repositories = [
    "namosim-release",
  ]
}

module "chroma_team" {
  source       = "./modules/release_team"
  team_name    = "chroma"
  members      = local.chroma_team
  repositories = local.chroma_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
