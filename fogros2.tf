locals {
  fogros2_team = [
    "vmayoral",
    "jeffi",
    "KeplerC",
    "KDharmarajanDev",
    "mjd3",
    "SimeonOA",
    "Zhanhugo",
    "ghassemiramtin",
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
}
