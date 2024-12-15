locals {
  uleroboticsgroup_team = [
    "mgonzs13",
  ]
  uleroboticsgroup_repositories = [
    "yasmin-release",
  ]
}

module "uleroboticsgroup_team" {
  source       = "./modules/release_team"
  team_name    = "uleroboticsgroup"
  members      = local.uleroboticsgroup_team
  repositories = local.uleroboticsgroup_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
