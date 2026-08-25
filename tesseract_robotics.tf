locals {
  tesseract_robotics_team = [
    "johnwason",
    "Levi-Armstrong",
    "marip8",
    "marrts",
    "rjoomen",
  ]
  tesseract_robotics_repositories = [
    "boost_plugin_loader-release",
  ]
}

module "tesseract_robotics_team" {
  source       = "./modules/release_team"
  team_name    = "tesseract_robotics"
  members      = local.tesseract_robotics_team
  repositories = local.tesseract_robotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
