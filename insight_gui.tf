locals {
  insight_gui_team = [
    "julianmueller",
  ]
  insight_gui_repositories = [
    "insight_gui-release",
  ]
}

module "insight_gui_team" {
  source       = "./modules/release_team"
  team_name    = "insight_gui"
  members      = local.insight_gui_team
  repositories = local.insight_gui_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
