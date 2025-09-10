locals {
  analogdevices_robotics_team = [
    "Adrian-Stanea",
    "SeptimiuVana",
    "VHolonec",
    "adisuciu",
    "rbolboac",
    "rbudai98",
  ]
  analogdevices_robotics_repositories = [
    "adi_iio-release",
    "adi_imu-release",
  ]
}

module "analogdevices_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "analogdevices_robotics"
  members      = local.analogdevices_robotics_team
  repositories = local.analogdevices_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
