locals {
  enpose_tech_team = [
    "kschauwecker",
  ]
  enpose_tech_repositories = [
    "enpose-ros-release",
  ]
}

module "enpose_tech_team" {
  source       = "./modules/release_team"
  team_name    = "enpose_tech"
  members      = local.enpose_tech_team
  repositories = local.enpose_tech_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
