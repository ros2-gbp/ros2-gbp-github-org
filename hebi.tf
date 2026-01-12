locals {
  hebi_team = [
    "cwbollinger",
    "hr1799",
    "iamtesch",
  ]
  hebi_repositories = [
    "hebi_cpp_api-release",
    "hebi_hardware-release",
    "hebi_msgs-release",
  ]
}

module "hebi_team" {
  source       = "./modules/release_team"
  team_name    = "hebi"
  members      = local.hebi_team
  repositories = local.hebi_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
