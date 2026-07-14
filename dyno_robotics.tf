locals {
  dyno_robotics_team = [
    "ErikOrjehag",
    "jack-mcmurdo",
    "ksatyaki",
  ]
  dyno_robotics_repositories = [
    "connection_inspector-release",
  ]
}

module "dyno_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "dyno_robotics"
  members      = local.dyno_robotics_team
  repositories = local.dyno_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
