locals {
  ifm3d_team = [
    "theseankelly",
  ]
  ifm3d_repositories = [
    "ifm3d-release",
  ]
}

module "ifm3d_team" {
  source       = "./modules/release_team"
  team_name    = "ifm3d"
  members      = local.ifm3d_team
  repositories = local.ifm3d_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
