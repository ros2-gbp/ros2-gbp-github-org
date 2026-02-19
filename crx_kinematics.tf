locals {
  crx_kinematics_team = [
    "danielcranston",
  ]
  crx_kinematics_repositories = [
    "crx_kinematics-release",
  ]
}

module "crx_kinematics_team" {
  source       = "./modules/release_team"
  team_name    = "crx_kinematics"
  members      = local.crx_kinematics_team
  repositories = local.crx_kinematics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
