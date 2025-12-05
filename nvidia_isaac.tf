locals {
  nvidia_isaac_team = [
    "sgillen",
  ]
  nvidia_isaac_repositories = [
    "greenwave_monitor-release",
  ]
}

module "nvidia_isaac_team" {
  source       = "./modules/release_team"
  team_name    = "nvidia_isaac"
  members      = local.nvidia_isaac_team
  repositories = local.nvidia_isaac_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
