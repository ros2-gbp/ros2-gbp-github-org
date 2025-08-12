locals {
  pradyum_group_team = [
    "pradyum",
  ]
  pradyum_group_repositories = [
    "dual_laser_merger-release",
  ]
}

module "pradyum_group_team" {
  source       = "./modules/release_team"
  team_name    = "pradyum_group"
  members      = local.pradyum_group_team
  repositories = local.pradyum_group_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
