locals {
  urdf_tutorial_team = [
    "DLu",
  ]
  urdf_tutorial_repositories = [
    "urdf_tutorial-release",
  ]
}

module "urdf_tutorial_team" {
  source       = "./modules/release_team"
  team_name    = "urdf_tutorial"
  members      = local.urdf_tutorial_team
  repositories = local.urdf_tutorial_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}

