locals {
  twist_mux_team = [
    "Noel215",
    "bmagyar",
  ]
  twist_mux_repositories = [
    "twist_mux-release",
    "twist_mux_msgs-release",
  ]
}

module "twist_mux_team" {
  source       = "./modules/release_team"
  team_name    = "twist_mux"
  members      = local.twist_mux_team
  repositories = local.twist_mux_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
