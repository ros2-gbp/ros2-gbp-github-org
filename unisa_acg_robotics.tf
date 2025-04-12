locals {
  unisa_acg_robotics_team = [
    "eferre89",
    "v8p1197",
  ]
  unisa_acg_robotics_repositories = [
    "inverse_dynamics_solver-release",
  ]
}

module "unisa_acg_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "unisa_acg_robotics"
  members      = local.unisa_acg_robotics_team
  repositories = local.unisa_acg_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
