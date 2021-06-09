
output "unmanaged_members" {
  value = setsubtract(
    data.github_organization.ros2-gbp.members,
    setunion(
      local.ros_admins,
      local.ros_team,
      local.apex_team,
      local.apriltag_team,
      local.autoware_team,
      local.behaviortree_team,
      local.connextdds_team,
      local.control_team,
      local.cyclonedds_team,
      local.diagnostics_team,
      local.fastcdr_team,
      local.fmi_team,
      local.gazebo_team,
      local.gurumdds_team,
      local.lgsvl_team,
      local.libg2o_team,
      local.locator_ros_bridge_team,
      local.swri_team,
      local.message_filters_team,
      local.mrpt2_team,
      local.navigation_team,
      local.nmea_team,
      local.nodl_team,
      local.octomap_team,
      local.ouster_drivers_team,
      local.perception_team,
      local.rclc_team,
      local.realsense_team,
      local.rmf_team,
      local.roboception_team,
      local.rosbag2_team,
      local.system_modes_team,
      local.tooling_wg_team,
      local.xacro_team,
    )
  )
}


output "unmanaged_repositories" {
  value = setsubtract(
    [for repo in data.github_organization.ros2-gbp.repositories: trimprefix(repo, "ros2-gbp/")],
    setunion(
      local.archived_repositories,
      local.ros_core_repositories,
      local.ros_base_repositories,
      local.ros_desktop_repositories,
      local.ros_team_repositories,
      local.rqt_repositories,
      local.apex_repositories,
      local.apriltag_repositories,
      local.autoware_repositories,
      local.behaviortree_repositories,
      local.connextdds_repositories,
      local.control_repositories,
      local.cyclonedds_repositories,
      local.diagnostics_repositories,
      local.fastcdr_repositories,
      local.fmi_repositories,
      local.gazebo_repositories,
      local.gurumdds_repositories,
      local.lgsvl_repositories,
      local.libg2o_repositories,
      local.locator_ros_bridge_repositories,
      local.swri_repositories,
      local.message_filters_repositories,
      local.mrpt2_repositories,
      local.navigation_repositories,
      local.nmea_repositories,
      local.nodl_repositories,
      local.octomap_repositories,
      local.ouster_drivers_repositories,
      local.perception_repositories,
      local.rclc_repositories,
      local.realsense_repositories,
      local.rmf_repositories,
      local.roboception_repositories,
      local.rosbag2_repositories,
      local.system_modes_repositories,
      local.tooling_wg_repositories,
      local.xacro_repositories,
    )
  )
}
