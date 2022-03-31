locals {
  pal_robotics_team = [
    "jordan-palacios",
    "lucamarchionni",
    "saikishor",
    "v-lopez",
  ]
  pal_robotics_repositories = [
    "backward_ros-release",
  ]
}

module "pal_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "pal_robotics"
  members      = local.pal_robotics_team
  repositories = local.pal_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
