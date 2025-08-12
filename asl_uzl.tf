locals {
  asl_uzl_team = [
    "GSchildbach",
    "midgard00",
  ]
  asl_uzl_repositories = [
    "ackmerann_nlmpc-release",
  ]
}

module "asl_uzl_team" {
  source       = "./modules/release_team"
  team_name    = "asl_uzl"
  members      = local.asl_uzl_team
  repositories = local.asl_uzl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
