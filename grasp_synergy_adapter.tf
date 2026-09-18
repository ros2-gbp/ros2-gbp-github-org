locals {
  grasp_synergy_adapter_team = [
    "shkwon98",
  ]
  grasp_synergy_adapter_repositories = [
    "grasp_synergy_adapter-release",
  ]
}

module "grasp_synergy_adapter_team" {
  source       = "./modules/release_team"
  team_name    = "grasp_synergy_adapter"
  members      = local.grasp_synergy_adapter_team
  repositories = local.grasp_synergy_adapter_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
