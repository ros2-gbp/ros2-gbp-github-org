locals {
  husarion_team = [
    "BOOTCFG",
    "DominikN",
    "KmakD",
    "delihus",
    "husarafal",
    "miloszlagan",
    "rafal-gorecki",
  ]
  husarion_repositories = [
    "husarion_components_description-release",
    "husarion_ugv_ros-release",
  ]
}

module "husarion_team" {
  source       = "./modules/release_team"
  team_name    = "husarion"
  members      = local.husarion_team
  repositories = local.husarion_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
