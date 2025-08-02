locals {
  fortefibre_team = [
    "HansRobo",
    "f0reachARR",
    "shouth",
  ]
  fortefibre_repositories = [
    "fluent_rviz-release",
    "parameter_expression-release",
  ]
}

module "fortefibre_team" {
  source       = "./modules/release_team"
  team_name    = "fortefibre"
  members      = local.fortefibre_team
  repositories = local.fortefibre_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
