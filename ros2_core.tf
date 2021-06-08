locals {
  ros_core_repositories = [
    "ament_cmake-release",
    "ament_cmake_ros-release",
    "ament_index-release",
    "ament_lint-release",
    "class_loader-release",
    "common_interfaces-release",
    "launch-release",
    "launch_ros-release",
    "pluginlib-release",
    "rcl-release",
    "rclcpp-release",
    "rclpy-release",
    "ros2cli_common_extensions-release",
    "ros_environment-release",
    "rosidl_defaults-release",
    "rosidl_defaults-release",
    "sros2-release",
  ]

  ros_base_repositories = [
    "rosbag2-release",
    "geometry2-release",
    "kdl_parser-release",
    "urdf-release",
    "robot_state_publisher-release",
  ]

  ros_desktop_repositories = [
    "angles-release",
    "depthimpage_to_laserscan-release",
    "joy-release",
    "pcl_conversions-release",
    "rviz2-release",
    "rviz_default_plugins-release",
    "teleop_twist_joy-release",
    "teleop_twist_keyboard-release",
    "demos-release",
    "tlsf-release",
    "examples-release",
  ]

  rqt_repositories = [
    "rqt_reconfigure-release",
    "rqt_console-release",
    "rqt_msg-release",
    "rqt_plot-release",
    "rqt_publisher-release",
    "rqt_py_console-release",
    "rqt_service_caller-release",
    "rqt_shell-release",
    "rqt_srv-release",
    "rqt_top-release",
    "rqt_topic-release",
    "rqt_robot_steering-release",
    "rqt_robot_monitor-release",
    "rqt_moveit-release",
    "rqt_image_view-release",
    "rqt_graph-release",
    "rqt_common_plugins-release",
    "rqt_bag-release",
    "rqt-release",
    "rqt_tf_tree-release",
  ]
}

resource "github_team" "ros2-team" {
  name = "ros2-team"
  description = "Members of the ROS team at Open Robotics"
  privacy = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "ros2-team" {
  for_each = setunion(local.ros_admins, local.ros_team)
  team_id = github_team.ros2-team.id
  username = each.value
  role = "member"
}

resource "github_repository" "ros_core" {
  for_each = toset(local.ros_core_repositories)
  name = each.value
  visibility = "public"
}

resource "github_repository" "ros_base" {
  for_each = toset(local.ros_base_repositories)
  name = each.value
  visibility = "public"
}

resource "github_repository" "ros_desktop" {
  for_each = toset(local.ros_desktop_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "ros2-team" {
  for_each = setunion(local.ros_base_repositories, local.ros_core_repositories, local.ros_desktop_repositories, local.rqt_repositories)
  team_id = github_team.ros2-team.id
  repository = each.value
  permission = "maintain"
}
