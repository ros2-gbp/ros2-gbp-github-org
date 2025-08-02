locals {
  fortefibre_team = [
    "f0reachARR",
  ]
  fortefibre_repositories = [
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
