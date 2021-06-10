data "github_organization" "ros2-gbp" {
  name = "ros2-gbp"
}

locals {
  ros_admins = [
    "clalancette",
    "cottsay",
    "nuclearsandwich",
    "tfoote",
  ]
  ros_team = [
    "ahcorde",
    "audrow",
    "Blast545", #TODO check status
    "BMarchi", #TODO check status
    "chapulina",
    "gonzodepedro",
    "hidmic",
    "ivanpauno",
    "j-rivero",
    "jacobperron",
    "Karsten1987",
    "Lobotuerk",
    "mabelzhang",
    "mjcarroll",
    "mjeronimo",
    "sloretz",
    "wjwwood",
  ]
}

resource "github_membership" "ros_admins" {
  for_each = toset(local.ros_admins)
  username = each.value
  role = "admin"
}

resource "github_membership" "ros_team" {
  for_each = toset(local.ros_team)
  username = each.value
  role = "member"
}

# Create memberships for the distinct set of all team members who aren't admins.
resource "github_membership" "members" {
  for_each = setsubtract(
    setunion(
      local.ros_team,
      local.apex_team,
      local.apriltag_team,
      local.async_web_server_cpp_team,
      local.autoware_team,
      local.behaviortree_team,
      local.bno055_team,
      local.connextdds_team,
      local.control_box_rst_team,
      local.control_team,
      local.cyberbotics_team,
      local.cyclonedds_team,
      local.diagnostics_team,
      local.fastcdr_team,
      local.fmi_team,
      local.gazebo_team,
      local.geographic_info_team,
      local.grbl_team,
      local.gurumdds_team,
      local.ifm3d_team,
      local.lgsvl_team,
      local.libg2o_team,
      local.locator_ros_bridge_team,
      local.message_filters_team,
      local.mrpt2_team,
      local.navigation_team,
      local.nmea_team,
      local.nodl_team,
      local.object_analytics_team,
      local.octomap_team,
      local.ouster_drivers_team,
      local.perception_team,
      local.rclc_team,
      local.realsense_team,
      local.rmf_team,
      local.roboception_team,
      local.robotwebtools_team,
      local.ros_canopen_team,
      local.rosauth_team,
      local.rosbag2_team,
      local.swri_team,
      local.system_modes_team,
      local.tooling_wg_team,
      local.tracing_team,
      local.transport_drivers_team,
      local.ublox_team,
      local.udp_msgs_team,
      local.urg_team,
      local.v4l2_camera_team,
      local.xacro_team,
    ),
    local.ros_admins
  )

  username = each.value
  role = "member"
}
