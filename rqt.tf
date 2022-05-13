locals {
  rqt_team = [
    "DLu",
    "arne48",
    "mlautman",
    "srishtidh",
  ]
  rqt_repositories = [
    "rqt_action-release",
    "rqt_console-release",
    "rqt_image_view-release",
    "rqt_moveit-release",
    "rqt_msg-release",
    "rqt_plot-release",
    "rqt_publisher-release",
    "rqt_py_console-release",
    "rqt_robot_dashboard-release",
    "rqt_robot_monitor-release",
    "rqt_robot_steering-release",
    "rqt_runtime_monitor-release",
    "rqt_service_caller-release",
    "rqt_shell-release",
    "rqt_srv-release",
    "rqt_top-release",
    "rqt_topic-release",
  ]
}

module "rqt_team" {
  source       = "./modules/release_team"
  team_name    = "rqt"
  members      = local.rqt_team
  repositories = local.rqt_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
