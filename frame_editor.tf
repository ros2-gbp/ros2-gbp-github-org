locals {
  frame_editor_team = [
    "ipa-danb",
  ]
  frame_editor_repositories = [
    "rqt_frame_editor_plugin-release",
  ]
}

module "frame_editor_team" {
  source       = "./modules/release_team"
  team_name    = "frame_editor"
  members      = local.frame_editor_team
  repositories = local.frame_editor_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
