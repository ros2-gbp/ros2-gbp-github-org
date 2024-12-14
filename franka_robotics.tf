locals {
  franka_robotics_team = [
    "AndreasKuhner",
    "BarisYazici",
    "Smith-JackSmith",
    "gomezgu",
    "kmohyeldin",
    "ssilenzi",
    "winkma",
  ]
  franka_robotics_repositories = [
    "franka_description-release",
  ]
}

module "franka_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "franka_robotics"
  members      = local.franka_robotics_team
  repositories = local.franka_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
