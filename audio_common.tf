locals {
  audio_common_team = [
    "knorth55",
  ]
  audio_common_repositories = [
    "audio_common-release",
  ]
}

module "audio_common_team" {
  source       = "./modules/release_team"
  team_name    = "audio_common"
  members      = local.audio_common_team
  repositories = local.audio_common_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
