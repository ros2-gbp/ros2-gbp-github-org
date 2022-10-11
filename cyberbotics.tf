locals {
  cyberbotics_team = [
    "BenjaminDeleze",
    "ad-daniel",
    "omichel",
    "stefaniapedrazzi",
    "ygoumaz",
  ]
  cyberbotics_repositories = [
    "webots_ros2-release",
  ]
}

module "cyberbotics_team" {
  source       = "./modules/release_team"
  team_name    = "cyberbotics"
  members      = local.cyberbotics_team
  repositories = local.cyberbotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
