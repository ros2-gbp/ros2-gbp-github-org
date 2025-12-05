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
    "pal_statistics-release",
    "play_motion2-release",
    "play_motion_builder-release",
  ]
}

module "pal_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "pal_robotics"
  members      = local.pal_robotics_team
  repositories = local.pal_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
