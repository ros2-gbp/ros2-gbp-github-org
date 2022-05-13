locals {
  robotwebtools_team = [
    "amacneil",
    "defunctzombie",
    "dirk-thomas",
    "jtbandes",
    "nuclearsandwich",

  ]
  robotwebtools_repositories = [
    "rosbridge_suite-release",
    "web_video_server-release",
  ]
}

module "robotwebtools_team" {
  source       = "./modules/release_team"
  team_name    = "robotwebtools"
  members      = local.robotwebtools_team
  repositories = local.robotwebtools_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
