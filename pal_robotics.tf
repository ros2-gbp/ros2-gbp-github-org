locals {
  pal_robotics_team = [
    "AntoBrandi",
    "Noel215",
    "lucamarchionni",
    "saikishor",
  ]
  pal_robotics_repositories = [
    "aruco_ros-release",
    "backward_ros-release",
    "kangaroo_moveit_config-release",
    "kangaroo_robot-release",
    "kangaroo_simulation-release",
    "launch_pal-release",
    "mujoco_vendor-release",
    "omni_base_navigation-release",
    "omni_base_robot-release",
    "omni_base_simulation-release",
    "pal_gazebo_plugins-release",
    "pal_gazebo_worlds-release",
    "pal_gripper-release",
    "pal_hey5-release",
    "pal_maps-release",
    "pal_navigation_cfg_public-release",
    "pal_pro_gripper-release",
    "pal_robotiq_gripper-release",
    "pal_sea_arm-release",
    "pal_sea_arm_moveit_config-release",
    "pal_sea_arm_simulation-release",
    "pal_statistics-release",
    "pal_urdf_utils-release",
    "play_motion2-release",
    "play_motion_builder-release",
    "pmb2_navigation-release",
    "pmb2_robot-release",
    "pmb2_simulation-release",
    "talos_moveit_config-release",
    "talos_robot-release",
    "talos_simulation-release",
    "tiago_dual_moveit_config-release",
    "tiago_dual_navigation-release",
    "tiago_dual_robot-release",
    "tiago_dual_simulation-release",
    "tiago_moveit_config-release",
    "tiago_navigation-release",
    "tiago_pro_head_robot-release",
    "tiago_pro_head_simulation-release",
    "tiago_pro_moveit_config-release",
    "tiago_pro_navigation-release",
    "tiago_pro_robot-release",
    "tiago_pro_simulation-release",
    "tiago_robot-release",
    "tiago_simulation-release",
    "urdf_test-release",
  ]
}

module "pal_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "pal_robotics"
  members      = local.pal_robotics_team
  repositories = local.pal_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
