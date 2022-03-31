locals {
  gurumdds_team = [
    "YoungJin-gurum",
    "jaemin-gurumnet",
  ]
  gurumdds_repositories = [
    "rmw_gurumdds-release",
    "rosidl_typesupport_gurumdds-release",
  ]
}

module "gurumdds_team" {
  source       = "./modules/release_team"
  team_name    = "gurumdds"
  members      = local.gurumdds_team
  repositories = local.gurumdds_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
