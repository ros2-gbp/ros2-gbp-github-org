locals {
  plotjuggler_team = [
    "facontidavide",
  ]
  plotjuggler_repositories = [
    "plotjuggler-ros-plugins-release",
    "plotjuggler-release",
    "plotjuggler_msgs-release",
  ]
}

module "plotjuggler_team" {
  source       = "./modules/release_team"
  team_name    = "plotjuggler"
  members      = local.plotjuggler_team
  repositories = local.plotjuggler_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
