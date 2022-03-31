locals {
  astuff_team = [
    "icolwell-as",
  ]
  astuff_repositories = [
    "automotive_autonomy_msgs-release",
    "avt_vimba_camera-release",
  ]
}

module "astuff_team" {
  source       = "./modules/release_team"
  team_name    = "astuff"
  members      = local.astuff_team
  repositories = local.astuff_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
