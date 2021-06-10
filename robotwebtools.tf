locals {
  robotwebtools_team = [
    "nuclearsandwich",
    "dirk-thomas",
  ]
  robotwebtools_repositories = [
    "rosbridge_suite-release",
    "web_video_server-release",
  ]
}

module "robotwebtools_team" {
  source = "./modules/release_team"
  team_name = "robotwebtools"
  members = local.robotwebtools_team
  repositories = local.robotwebtools_repositories
}
