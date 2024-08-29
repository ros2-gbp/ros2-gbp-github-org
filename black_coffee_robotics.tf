locals {
  black_coffee_robotics_team = [
    "D-1shu",
    "arthurgomes4",
    "exMachina316",
    "ggupta9777",
  ]
  black_coffee_robotics_repositories = [
    "bcr_bot-release",
    "vector_pursuit_controller-release",
  ]
}

module "black_coffee_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "black_coffee_robotics"
  members      = local.black_coffee_robotics_team
  repositories = local.black_coffee_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
