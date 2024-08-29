locals {
  turtle_nest_team = [
    "Jannkar",
  ]
  turtle_nest_repositories = [
    "turtle_nest-release",
  ]
}

module "turtle_nest_team" {
  source       = "./modules/release_team"
  team_name    = "turtle_nest"
  members      = local.turtle_nest_team
  repositories = local.turtle_nest_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
