locals {
  naoqi_team = [
    "Karsten1987",
    "mbusy",
    "mikaelarguedas",
    "zygopter",
  ]
  naoqi_repositories = [
    "libqi-release",
    "libqicore-release",
    "nao_meshes-release",
    "naoqi_bridge_msgs-release",
    "naoqi_driver-release",
    "pepper_meshes-release",
  ]
}

module "naoqi_team" {
  source       = "./modules/release_team"
  team_name    = "naoqi"
  members      = local.naoqi_team
  repositories = local.naoqi_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
