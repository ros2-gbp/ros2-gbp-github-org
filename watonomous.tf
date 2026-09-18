locals {
  watonomous_team = [
    "brianzheng206",
    "lucasreljic",
    "wilsonchenghy",
  ]
  watonomous_repositories = [
    "wato_monorepo-release",
  ]
}

module "watonomous_team" {
  source       = "./modules/release_team"
  team_name    = "watonomous"
  members      = local.watonomous_team
  repositories = local.watonomous_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
