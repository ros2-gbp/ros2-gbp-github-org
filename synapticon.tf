locals {
  synapticon_team = [
    "floweisshardt",
    "zvezdan94",
  ]
  synapticon_repositories = [
    "synapticon_ros2_control-release",
  ]
}

module "synapticon_team" {
  source       = "./modules/release_team"
  team_name    = "synapticon"
  members      = local.synapticon_team
  repositories = local.synapticon_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
