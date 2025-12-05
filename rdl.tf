locals {
  rdl_team = [
    "jlack1987",
  ]
  rdl_repositories = [
    "data_tamer_tools-release",
    "foxglove_sdk_vendor-release",
    "rdl-release",
  ]
}

module "rdl_team" {
  source       = "./modules/release_team"
  team_name    = "rdl"
  members      = local.rdl_team
  repositories = local.rdl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
