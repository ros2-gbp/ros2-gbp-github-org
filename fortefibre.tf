locals {
  fortefibre_team = [
    "HansRobo",
    "shouth",
  ]
  fortefibre_repositories = [
    "fluent_rviz-release",
  ]
}

module "fortefibre_team" {
  source       = "./modules/release_team"
  team_name    = "fortefibre"
  members      = local.fortefibre_team
  repositories = local.fortefibre_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
