locals {
  kinematics_interface_pinocchio_team = [
    "justagist",
  ]
  kinematics_interface_pinocchio_repositories = [
    "kinematics_interface_pinocchio-release",
  ]
}

module "kinematics_interface_pinocchio_team" {
  source       = "./modules/release_team"
  team_name    = "kinematics_interface_pinocchio"
  members      = local.kinematics_interface_pinocchio_team
  repositories = local.kinematics_interface_pinocchio_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
