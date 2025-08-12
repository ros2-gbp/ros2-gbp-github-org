locals {
  analogdevicesinc_robotics_sys_sw_team = [
    "raebelchristo-adi",
    "anilsripadarao",
    "SagarWalishetti",
    "Prasanna-Bhat",
  ]
  analogdevicesinc_robotics_sys_sw_repositories = [
    "adi_3dtof_image_stitching-release",
    "depth_obstacle_detect_ros-release",
  ]
}

module "analogdevicesinc_robotics_sys_sw_team" {
  source       = "./modules/release_team"
  team_name    = "analogdevicesinc_robotics_sys_sw"
  members      = local.analogdevicesinc_robotics_sys_sw_team
  repositories = local.analogdevicesinc_robotics_sys_sw_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
