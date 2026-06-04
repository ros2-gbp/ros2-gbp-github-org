locals {
  mrpt2_team = [
    "jlblancoc",
    "jolting",
  ]
  mrpt2_repositories = [
    "gtsam2mrpt_serial-release",
    "mola-release",
    "mola_academic_datasets-release",
    "mola_common-release",
    "mola_gnss_to_markers-release",
    "mola_imu_preintegration-release",
    "mola_input_ouster-release",
    "mola_input_rosbag1-release",
    "mola_lidar_odometry-release",
    "mola_mapper_2d-release",
    "mola_sm_loop_closure-release",
    "mola_state_estimation-release",
    "mola_test_datasets-release",
    "mp2p_icp-release",
    "mrpt2-release",
    "mrpt3-release",
    "mrpt_msgs-release",
    "mrpt_navigation-release",
    "mrpt_path_planning-release",
    "mrpt_ros_bridge-release",
    "mrpt_ros-release",
    "mrpt_sensors-release",
    "mrpt_slam-release",
    "mvsim-release",
    "pose_cov_ops-release",
    "python_mrpt_ros-release",
    "rosbag_timing_inspector-release",
  ]
}

module "mrpt2_team" {
  source       = "./modules/release_team"
  team_name    = "mrpt2"
  members      = local.mrpt2_team
  repositories = local.mrpt2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
