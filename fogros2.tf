locals {
  fogros2_team = [
    "vmayoral",
    "jeffi",
    "KeplerC",
    "KDharmarajanDev",
    "mjd3",
    "SimeonOA",
    "zhanhugo",
    "xzrderek",
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
