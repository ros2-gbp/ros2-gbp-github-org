locals {
  mobile_catkin_modules_build_development_tools_team = [
    "RonaldsonBellande",
  ]
  mobile_catkin_modules_build_development_tools_repositories = [
    "mobile_catkin_modules_build_development_tools-release",
  ]
}

module "mobile_catkin_modules_build_development_tools_team" {
  source       = "./modules/release_team"
  team_name    = "mobile_catkin_modules_build_development_tools"
  members      = local.mobile_catkin_modules_build_development_tools_team
  repositories = local.mobile_catkin_modules_build_development_tools_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
