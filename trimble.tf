locals {
  trimble_team = [
    "alambert-trimble",
    "andre-nguyen",
    "andre-trimble",
    "bcong-trmb",
    "keithykleung",
  ]
  trimble_repositories = [
    "trimble_driver_ros-release",
  ]
}

module "trimble_team" {
  source       = "./modules/release_team"
  team_name    = "trimble"
  members      = local.trimble_team
  repositories = local.trimble_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
