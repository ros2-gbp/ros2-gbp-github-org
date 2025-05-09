locals {
  shangao_team = [
    "ma-shangao",
  ]
  shangao_repositories = [
    "at_sonde_ros_driver-release",
  ]
}

module "shangao_team" {
  source       = "./modules/release_team"
  team_name    = "shangao"
  members      = local.shangao_team
  repositories = local.shangao_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
