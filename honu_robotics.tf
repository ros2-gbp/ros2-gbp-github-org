locals {
  honu_robotics_team = [
    "ahcorde",
    "bsb808",
    "caguero",
    "j-rivero",
  ]
  honu_robotics_repositories = [
    "ehukai-release",
  ]
}

module "honu_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "honu_robotics"
  members      = local.honu_robotics_team
  repositories = local.honu_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
