locals {
  archived_repositories = [
    "ament_python-release",
    "ament_tools-release",
    "ceres_solver-release",
    "console_bridge-release",
    "gmock_vendor-release",
    "gtest_vendor-release",
    "osrf_testings_tools_cpp-release",
    "poco_vendor-release",
    "rmw_opensplice-release",
    "robot_model-release",
    "rosidl_typesupport_opensplice-release",
    "system_tests-release",
    "uncrustify-release",
  ]
}

resource "github_repository" "archived_repositories" {
  for_each = toset(local.archived_repositories)
  name = each.value
  archived = true
}
