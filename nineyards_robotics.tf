locals {
  nineyards_robotics_team = [
    "alistair-english",
  ]
  nineyards_robotics_repositories = [
    "jig-release",
  ]
}

module "nineyards_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "nineyards_robotics"
  members      = local.nineyards_robotics_team
  repositories = local.nineyards_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
