locals {
  rqt_team = [
    "arne48",
    "srishtidh",
  ]
  rqt_repositories = [
    "rqt_console-release",
    "rqt_robot_steering-release",
  ]
}

module "rqt_team" {
  source = "./modules/release_team"
  team_name = "rqt"
  members = local.rqt_team
  repositories = local.rqt_repositories
}
