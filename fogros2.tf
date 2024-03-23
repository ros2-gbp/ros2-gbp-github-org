locals {
  fogros2_team = [
    "KDharmarajanDev",
    "KeplerC",
    "SimeonOA",
    "mjd3",
    "vmayoral",
    "xzrderek",
    "zhanhugo",
  ]
  fogros2_repositories = [
    "fogros2-release",
  ]
}

module "fogros2_team" {
  source       = "./modules/release_team"
  team_name    = "fogros2"
  members      = local.fogros2_team
  repositories = local.fogros2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
