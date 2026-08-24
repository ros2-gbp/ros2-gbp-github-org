locals {
  netft_team = [
    "han-xudong",
  ]
  netft_repositories = [
    "ros-netft-release",
  ]
}

module "netft_team" {
  source       = "./modules/release_team"
  team_name    = "netft"
  members      = local.netft_team
  repositories = local.netft_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
