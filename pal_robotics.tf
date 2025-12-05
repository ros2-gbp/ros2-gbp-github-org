locals {
  pal_robotics_team = [
    "Noel215",
    "jordan-palacios",
    "lucamarchionni",
    "saikishor",
  ]
  pal_robotics_repositories = [
    "aruco_ros-release",
    "backward_ros-release",
    "launch_pal-release",
    "mujoco_vendor-release",
    "pal_pro_gripper-release",
    "pal_sea_arm-release",
    "pal_sea_arm_moveit_config-release",
    "pal_sea_arm_simulation-release",
    "pal_statistics-release",
    "pal_urdf_utils-release",
    "play_motion2-release",
    "play_motion_builder-release",
    "tiago_pro_head_robot-release",
    "tiago_pro_head_simulation-release",
    "tiago_pro_moveit_config-release",
    "tiago_pro_navigation-release",
    "tiago_pro_robot-release",
    "tiago_pro_simulation-release",
  ]
}

module "pal_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "pal_robotics"
  members      = local.pal_robotics_team
  repositories = local.pal_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
