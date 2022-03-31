locals {
  fastcdr_team = [
    "MiguelCompany",
  ]
  fastcdr_repositories = [
    "fastcdr-release",
    "fastrtps-release",
    "foonathan_memory_vendor-release",
    "rmw_fastrtps-release",
    "rosidl_typesupport_fastrtps-release",
  ]
}

module "fastcdr_team" {
  source       = "./modules/release_team"
  team_name    = "fastcdr"
  members      = local.fastcdr_team
  repositories = local.fastcdr_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
