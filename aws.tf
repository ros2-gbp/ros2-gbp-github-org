locals {
  aws_team = [
    "emersonknapp",
  ]
  aws_repositories = [
    "aws_robomaker_small_warehouse_world-release",
  ]
}

module "aws_team" {
  source       = "./modules/release_team"
  team_name    = "aws"
  members      = local.aws_team
  repositories = local.aws_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
