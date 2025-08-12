locals {
  teleop_team = [
    "Noel215",
    "bmagyar",
  ]
  teleop_repositories = [
    "teleop_tools-release",
  ]
}

module "teleop_team" {
  source       = "./modules/release_team"
  team_name    = "teleop"
  members      = local.teleop_team
  repositories = local.teleop_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
