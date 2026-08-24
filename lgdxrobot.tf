locals {
  lgdxrobot_team = [
    "yukaitung",
  ]
  lgdxrobot_repositories = [
    "lgdxrobot2_rplidar_c1-release",
  ]
}

module "lgdxrobot_team" {
  source       = "./modules/release_team"
  team_name    = "lgdxrobot"
  members      = local.lgdxrobot_team
  repositories = local.lgdxrobot_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
