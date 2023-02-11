locals {
  plansys2_team = [
    "fmrico",
  ]
  plansys2_repositories = [
    "popf-release",
    "ros2_planning_system-release",
  ]
}

module "plansys2_team" {
  source       = "./modules/release_team"
  team_name    = "plansys2"
  members      = local.plansys2_team
  repositories = local.plansys2_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
