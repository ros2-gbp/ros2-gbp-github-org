locals {
  open_planning_team = [
    "eholum",
    "sea-bass",
    "sjahr",
  ]
  open_planning_repositories = [
    "roboplan-release",
    "roboplan_ros-release",
    "toppra-release",
  ]
}

module "open_planning_team" {
  source       = "./modules/release_team"
  team_name    = "open_planning"
  members      = local.open_planning_team
  repositories = local.open_planning_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
