locals {
  microstrain_team = [
    "robbiefish",
  ]
  microstrain_repositories = [
    "microstrain_inertial-release",
    "ntrip_client-release",
  ]
}

module "microstrain_team" {
  source       = "./modules/release_team"
  team_name    = "microstrain"
  members      = local.microstrain_team
  repositories = local.microstrain_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
