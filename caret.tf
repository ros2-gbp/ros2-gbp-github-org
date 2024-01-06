locals {
  caret_team = [
    "h-suzuki-isp",
    "isp-uetsuki",
    "m-amatsu",
    "nabetetsu",
    "ymski",
  ]
  caret_repositories = [
    "caret_analyze-release",
    "caret_analyze_cpp_impl-release",
    "caret_trace-release",
    "ros2caret-release",
  ]
}

module "caret_team" {
  source       = "./modules/release_team"
  team_name    = "caret"
  members      = local.caret_team
  repositories = local.caret_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
