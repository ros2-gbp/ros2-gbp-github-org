locals {
  alliedvision_team = [
    "dlangenkamp-avt",
    "fklostermann",
    "khoepke",
  ]
  alliedvision_repositories = [
    "vimbax_ros2_driver-release",
  ]
}

module "alliedvision_team" {
  source       = "./modules/release_team"
  team_name    = "alliedvision"
  members      = local.alliedvision_team
  repositories = local.alliedvision_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
