locals {
  irobot_education_team = [
    "alsora",
    "justinIRBT",
    "shamlian",
  ]
  irobot_education_repositories = [
    "create3_sim-release",
    "irobot_create_msgs-release",
  ]
}

module "irobot_education_team" {
  source       = "./modules/release_team"
  team_name    = "irobot_education"
  members      = local.irobot_education_team
  repositories = local.irobot_education_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
