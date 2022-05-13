locals {
  neobotix_team = [
    "padhupradheep",
  ]
  neobotix_repositories = [
    "neo_simulation2-release",
  ]
}

module "neobotix_team" {
  source       = "./modules/release_team"
  team_name    = "neobotix"
  members      = local.neobotix_team
  repositories = local.neobotix_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
