locals {
  orco_team = [
    "daviddorf2023",
  ]
  orco_repositories = [
    "multidim_rrt_planner-release",
  ]
}

module "orco_team" {
  source       = "./modules/release_team"
  team_name    = "orco"
  members      = local.orco_team
  repositories = local.orco_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
