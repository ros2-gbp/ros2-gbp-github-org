locals {
  nlamprian_team = [
    "nlamprian",
  ]
  nlamprian_repositories = [
    "gazebo_video_monitors-release"
  ]
}

module "nlamprian_team" {
  source       = "./modules/release_team"
  team_name    = "nlamprian"
  members      = local.nlamprian_team
  repositories = local.nlamprian_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
