locals {
  analogdevicesinc_tmcl_team = [
    "CAcarADI",
    "jmacagba",
    "KApostolADI",
    "mmaralit-adi",
  ]
  analogdevicesinc_tmcl_repositories = [
    "tmcl_ros2-release",
  ]
}

module "analogdevicesinc_tmcl_team" {
  source       = "./modules/release_team"
  team_name    = "analogdevicesinc_tmcl"
  members      = local.analogdevicesinc_tmcl_team
  repositories = local.analogdevicesinc_tmcl_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
