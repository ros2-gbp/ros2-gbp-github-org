locals {
  hhcm_iit_team = [
    "damigas",
    "torydebra",
  ]
  hhcm_iit_repositories = [
    "nicla_vision_ros2-release",
  ]
}

module "hhcm_iit_team" {
  source       = "./modules/release_team"
  team_name    = "hhcm_iit"
  members      = local.hhcm_iit_team
  repositories = local.hhcm_iit_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
