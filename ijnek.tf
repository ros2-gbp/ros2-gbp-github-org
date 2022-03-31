locals {
  ijnek_team = [
    "ijnek",
  ]
  ijnek_repositories = [
    "nao_button_sim-release",
    "nao_interfaces-release",
    "nao_lola-release",
    "soccer_object_msgs-release",
    "soccer_visualization-release",
  ]
}

module "ijnek_team" {
  source       = "./modules/release_team"
  team_name    = "ijnek"
  members      = local.ijnek_team
  repositories = local.ijnek_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
