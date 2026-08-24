locals {
  int2dds_team = [
    "Intellectus-BC",
    "Intellectus-BH",
    "Intellectus-Eric",
    "Intellectus-Gahee",
    "Intellectus-Garam",
    "Intellectus-GicheolJeon",
    "Intellectus-SonHyeonseo",
    "Intellectus-Sub",
  ]
  int2dds_repositories = [
    "rmw_int2dds-release",
  ]
}

module "int2dds_team" {
  source       = "./modules/release_team"
  team_name    = "int2dds"
  members      = local.int2dds_team
  repositories = local.int2dds_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
