locals {
  pinocchio_team = [
    "jcarpent",
    "nim65s",
    "wxmerkt",
  ]
  pinocchio_repositories = [
    "pinocchio-release",
  ]
}

module "pinocchio_team" {
  source       = "./modules/release_team"
  team_name    = "pinocchio"
  members      = local.pinocchio_team
  repositories = local.pinocchio_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
