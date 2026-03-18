locals {
  lfc_team = [
    "MaximilienNaveau",
    "nim65s",
    "olivier-stasse",
  ]
  lfc_repositories = [
    "linear-feedback-controller-msgs-release",
    "linear-feedback-controller-release",
  ]
}

module "lfc_team" {
  source       = "./modules/release_team"
  team_name    = "lfc"
  members      = local.lfc_team
  repositories = local.lfc_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
