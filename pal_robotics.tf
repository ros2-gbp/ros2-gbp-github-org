locals {
  pal_robotics_team = [
    "Noel215",
    "jordan-palacios",
    "lucamarchionni",
    "saikishor",
  ]
  pal_robotics_repositories = [
    "backward_ros-release",
    "pal_statistics-release",
  ]
}

module "pal_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "pal_robotics"
  members      = local.pal_robotics_team
  repositories = local.pal_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
