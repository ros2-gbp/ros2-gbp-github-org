locals {
  mrt_cmake_modules_team = [
    "JohannesBeck",
  ]
  mrt_cmake_modules_repositories = [
    "mrt_cmake_modules-release",
  ]
}

module "mrt_cmake_modules_team" {
  source       = "./modules/release_team"
  team_name    = "mrt_cmake_modules"
  members      = local.mrt_cmake_modules_team
  repositories = local.mrt_cmake_modules_repositories
}
