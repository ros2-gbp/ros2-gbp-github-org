locals {
  mrpt2_team = [
    "jlblancoc",
    "jolting",
  ]
  mrpt2_repositories = [
    "mrpt2-release",
  ]
}

module "mrpt2_team" {
  source = "./modules/release_team"
  team_name = "mrpt2"
  members = local.mrpt2_team
  repositories = local.mrpt2_repositories
}
