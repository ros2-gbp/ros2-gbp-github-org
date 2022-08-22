locals {
  skylove_team = [
    "SkyloveQiu",
  ]
  skylove_repositories = [
    "ROS2_Robotino-release",
  ]
}

module "skylove_team" {
  source = "./modules/release_team"
  team_name = "skylove"
  members = local.skylove_team
  repositories = local.skylove_repositories
  depends_on = [github_membership.members, github_repository.repositories]
}
