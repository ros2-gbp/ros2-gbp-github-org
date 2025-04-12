locals {
  open_sound_control_team = [
    "chrisib",
  ]
  open_sound_control_repositories = [
    "open_sound_control-release",
  ]
}

module "open_sound_control_team" {
  source       = "./modules/release_team"
  team_name    = "open_sound_control"
  members      = local.open_sound_control_team
  repositories = local.open_sound_control_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
