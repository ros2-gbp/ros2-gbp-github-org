locals {
  imrclab_team = [
    "whoenig",
  ]
  imrclab_repositories = [
    "motion_capture_tracking-release",
  ]
}

module "imrclab_team" {
  source       = "./modules/release_team"
  team_name    = "imrclab"
  members      = local.imrclab_team
  repositories = local.imrclab_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
