locals {
  p2p_industries_team = [
    "Zollerboy1",
  ]
  p2p_industries_repositories = [
    "hyveos_bridge-release",
    "hyveos_msgs-release",
  ]
}

module "p2p_industries_team" {
  source       = "./modules/release_team"
  team_name    = "p2p_industries"
  members      = local.p2p_industries_team
  repositories = local.p2p_industries_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
