locals {
  stonier_team = [
    "stonier",
  ]
  stonier_repositories = [
    "ecl_core-release",
    "ecl_lite-release",
    "ecl_tools-release",
    "sophus-release",
  ]
}

module "stonier_team" {
  source       = "./modules/release_team"
  team_name    = "stonier"
  members      = local.stonier_team
  repositories = local.stonier_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
