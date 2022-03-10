locals {
  universal_robots_team = [
    "fmauch",
    "t-schnell",
  ]
  universal_robots_repositories = [
    "universal_robots-release",
  ]
}

module "universal_robots_team" {
  source       = "./modules/release_team"
  team_name    = "universal_robots"
  members      = local.universal_robots_team
  repositories = local.universal_robots_repositories
}
