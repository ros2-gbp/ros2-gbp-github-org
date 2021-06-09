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
    "depthimage_to_laserscan-release",
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
    "rqt_action-release",
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

  ros_team_repositories = [
    "ament_package-release",
    "bond_core-release",
    "cartographer-release",
    "cartographer_ros-release",
    "console_bridge_vendor-release",
    "domain_bridge-release",
    "eigen3_cmake_module-release",
    "eigen_stl_containers-release",
    "example_interfaces-release",
    "filters-release",
    "google_benchmark_vendor-release",
    "googletest-release",
    "image_common-release",
    "image_transport_plugins-release",
    "interactive_markers-release",
    "joint_state_publisher-release",
    "joystick_drivers-release",
    "laser_proc-release",
    "libyaml_vendor-release",
    "mimick_vendor-release",
    "navigation_msgs-release",
    "orocos_kinematics_dynamics-release",
    "osrf_pycommon-release",
    "osrf_testing_tools_cpp-release",
    "performance_test_fixture-release",
    "phidgets_drivers-release",
    "pybind11_vendor-release",
    "python_cmake_module-release",
    "python_qt_binding-release",
    "qt_gui_core-release",
    "rcl_interfaces-release",
    "rcl_logging-release",
    "rcpputils-release",
    "rcutils-release",
    "realtime_support-release",
    "resource_retriever-release",
    "rmw-release",
    "rmw_connext-release", # archive after Foxy end-of-support
    "rmw_dds_common-release",
    "rmw_implementation-release",
    "ros1_bridge-release",
    "ros2cli-release",
    "ros_testing-release",
    "ros_tutorials-release",
    "ros_workspace-release",
    "rosbridge_suite-release",
    "rosidl-release",
    "rosidl_dds-release",
    "rosidl_python-release",
    "rosidl_runtime_py-release",
    "rosidl_typesupport-release",
    "rosidl_typesupport_connext-release", #archive after Foxy end-of-support
    "rpyutils-release",
    "rviz-release",
    "slide_show-release",
    "spdlog_vendor-release",
    "tango_icons_vendor-release",
    "test_interface_files-release",
    "tinydir_vendor-release",
    "tinyxml_vendor-release",
    "tinyxml2_vendor-release",
    "uncrustify_vendor-release",
    "unique_identifier_msgs-release",
    "urdfdom-release",
    "urdfdom_headers-release",
    "urdfdom_py-release",
    "variants-release",
    "velodyne-release",
    "vision_opencv-release",
    "yaml_cpp_vendor-release",
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

resource "github_repository" "ros_team_repositories" {
  for_each = toset(local.ros_team_repositories)
  name = each.value
  visibility = "public"
}

resource "github_team_repository" "ros2-team" {
  for_each = setunion(local.ros_base_repositories, local.ros_core_repositories, local.ros_desktop_repositories, local.ros_team_repositories, local.rqt_repositories)
  team_id = github_team.ros2-team.id
  repository = each.value
  permission = "maintain"
}
