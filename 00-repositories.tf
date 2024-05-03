# Create memberships for the distinct set of all team members who aren't admins.
locals {
  organization_repositories = setunion(
    local._42dot_repositories,
    local._archived_repositories,
    local.acceleration_wg_repositories,
    local.ackermann_msgs_repositories,
    local.aerostack2_repositories,
    local.analogdevicesinc_tmcl_repositories,
    local.andino_repositories,
    local.apex_repositories,
    local.apriltag_repositories,
    local.astuff_repositories,
    local.async_web_server_cpp_repositories,
    local.aussierobots_repositories,
    local.autoware_repositories,
    local.aws_repositories,
    local.behaviortree_repositories,
    local.black_coffee_robotics_repositories,
    local.bno055_repositories,
    local.boeing_repositories,
    local.borglab_repositories,
    local.bosch_engineering_ohw_repositories,
    local.caret_repositories,
    local.cascade_lifecycle_repositories,
    local.cerberus_repositories,
    local.connextdds_repositories,
    local.control_box_rst_repositories,
    local.control_repositories,
    local.cyberbotics_repositories,
    local.cyclonedds_repositories,
    local.data_tamer_repositories,
    local.dexory_repositories,
    local.diagnostics_repositories,
    local.dolly_repositories,
    local.dynamixel_community_repositories,
    local.eclipse_ecal_repositories,
    local.eigenpy_repositories,
    local.ess_imu_driver2_repositories,
    local.event_camera_repositories,
    local.executive_smach_repositories,
    local.fastcdr_repositories,
    local.fictionlab_repositories,
    local.fields2cover_repositories,
    local.filters_repositories,
    local.flexbe_repositories,
    local.flir_camera_driver_repositories,
    local.fmi_repositories,
    local.fogros2_repositories,
    local.fortefibre_repositories,
    local.four_wheel_steering_msgs_repositories,
    local.foxglove_bridge_repositories,
    local.foxglove_msgs_repositories,
    local.gazebo_repositories,
    local.geographic_info_repositories,
    local.grbl_repositories,
    local.grid_map_geo_repositories,
    local.grid_map_repositories,
    local.gscam_repositories,
    local.gstavrinos_repositories,
    local.gurumdds_repositories,
    local.hpp_fcl_repositories,
    local.iceoryx_repositories,
    local.ifm3d_repositories,
    local.ijnek_repositories,
    local.ika_rwth_aachen_repositories,
    local.image_transport_plugins_repositories,
    local.imrclab_repositories,
    local.imu_pipeline_repositories,
    local.imu_tools_repositories,
    local.interactive_marker_twist_repositories,
    local.introlab_repositories,
    local.irobot_education_repositories,
    local.josh_newans_repositories,
    local.kinova_robotics_repositories,
    local.kobuki_base_repositories,
    local.kuka_repositories,
    local.lanelet2_repositories,
    local.lgsvl_repositories,
    local.libcamera_repositories,
    local.libg2o_repositories,
    local.locator_ros_bridge_repositories,
    local.locusrobotics_repositories,
    local.maliput_repositories,
    local.marine_msgs_repositories,
    local.mavlink_repositories,
    local.metro_robots_repositories,
    local.micro_ros_diagnostics_repositories,
    local.micro_ros_msgs_repositories,
    local.microstrain_repositories,
    local.minipada_repositories,
    local.misc_utilities_repositories,
    local.mobile_catkin_modules_build_development_tools_repositories,
    local.mocap_optitrack_repositories,
    local.moveit_repositories,
    local.mrpt2_repositories,
    local.mrt_cmake_modules_repositories,
    local.naoqi_repositories,
    local.navigation_repositories,
    local.neobotix_repositories,
    local.niwcpac_repositories,
    local.nlamprian_repositories,
    local.nmea_repositories,
    local.nobleo_repositories,
    local.nodl_repositories,
    local.ntpd_driver_repositories,
    local.numsr_repositories,
    local.object_analytics_repositories,
    local.octomap_repositories,
    local.odri_repositories,
    local.ompl_repositories,
    local.openni2_camera_repositories,
    local.orco_repositories,
    local.ouster_drivers_repositories,
    local.ouster_repositories,
    local.ouxt_repositories,
    local.pal_robotics_repositories,
    local.pangolin_repositories,
    local.perception_repositories,
    local.phidgets_repositories,
    local.picknik_repositories,
    local.pinocchio_repositories,
    local.plansys2_repositories,
    local.plotjuggler_repositories,
    local.point_cloud_transport_repositories,
    local.py_trees_repositories,
    local.rclc_repositories,
    local.rcpputils_repositories,
    local.realsense_repositories,
    local.rmf_repositories,
    local.roboception_repositories,
    local.robot_calibration_repositories,
    local.robot_localization_repositories,
    local.robotis_repositories,
    local.robotont_repositories,
    local.robotwebtools_repositories,
    local.ros4hri_repositories,
    local.ros_canopen_repositories,
    local.ros_event_camera_repositories,
    local.ros_industrial_repositories,
    local.ros_repositories,
    local.rosauth_repositories,
    local.rosbag2_repositories,
    local.rospy_message_converter_repositories,
    local.rplidar_ros_repositories,
    local.rqt_repositories,
    local.rt_net_repositories,
    local.rtabmap_repositories,
    local.ruckig_repositories,
    local.rudislabs_repositories,
    local.schunk_svh_repositories,
    local.security_wg_repositories,
    local.septentrio_users_repositories,
    local.sick_safevisionary_repositories,
    local.sick_scan_xd_repositories,
    local.simple_launch_repositories,
    local.simple_robotics_repositories,
    local.skylove_repositories,
    local.slider_publisher_repositories,
    local.smacc2_repositories,
    local.snt_arg_repositories,
    local.sports_repositories,
    local.stonier_repositories,
    local.swri_repositories,
    local.sync_parameter_server_repositories,
    local.system_modes_repositories,
    local.teamspatzenhirn_repositories,
    local.techmagic_repositories,
    local.tf_transformations_repositories,
    local.the_construct_repositories,
    local.tier4_repositories,
    local.tooling_wg_repositories,
    local.tracing_repositories,
    local.traclabs_repositories,
    local.transport_drivers_repositories,
    local.tri_repositories,
    local.tsid_repositories,
    local.turtlebot4_repositories,
    local.tuw_robotics_repositories,
    local.twist_mux_repositories,
    local.ublox_repositories,
    local.udp_msgs_repositories,
    local.umdlife_repositories,
    local.universal_robots_repositories,
    local.urdf_tutorial_repositories,
    local.urg_repositories,
    local.usb_cam_repositories,
    local.v4l2_camera_repositories,
    local.velodyne_repositories,
    local.velodyne_simulator_repositories,
    local.vision_msgs_repositories,
    local.vision_opencv_repositories,
    local.vision_repositories,
    local.visp_repositories,
    local.vrpn_repositories,
    local.wep21_repositories,
    local.xacro_repositories,
    local.yukkysaito_repositories,
    local.zbar_ros_repositories,
    local.zenoh_bridge_dds_repositories,
  )
}

resource "github_branch_default" "bloom_branch" {
  for_each = github_repository.repositories

  repository = each.value.name
  branch     = "master"
}

resource "github_repository" "repositories" {
  for_each = local.organization_repositories

  name         = each.value
  archived     = contains(local._archived_repositories, each.value)
  visibility   = "public"
  has_projects = false

  template {
    owner                = "ros2-gbp"
    repository           = "release-repository-template"
    include_all_branches = true
  }

  lifecycle {
    # Plans that destroy repository releases will delete the repository on
    # GitHub and that shouldn't be done in the normal course of operation.
    prevent_destroy = true
    # Ignore fields that are not set or managed by this terraform project
    # to prevent unecessary drift.
    ignore_changes = [
      allow_merge_commit,
      description,
      etag,
      has_downloads,
      has_issues,
      has_wiki,
      homepage_url,
      template,
      vulnerability_alerts
    ]
  }
}

# No team manages this repository.
# It is writable by organization admins only.
resource "github_repository" "ros2-gbp-github-org" {
  name         = "ros2-gbp-github-org"
  visibility   = "public"
  has_projects = false
  lifecycle {
    # Plans that destroy repository releases will delete the repository on
    # GitHub and that shouldn't be done in the normal course of operation.
    prevent_destroy = true
    # Ignore fields that are not set or managed by this terraform project
    # to prevent unecessary drift.
    ignore_changes = [
      allow_merge_commit,
      description,
      etag,
      has_downloads,
      has_issues,
      has_wiki,
      vulnerability_alerts
    ]
  }
}
