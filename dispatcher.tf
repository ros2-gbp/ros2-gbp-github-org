locals {
  dispatcher_team = [
    "dennis-wai",
    "kwehage",
    "PastorD",
    "preston-rogers",
  ]
  dispatcher_repositories = [
    "dispatcher-release",
  ]
}

module "dispatcher_team" {
  source       = "./modules/release_team"
  team_name    = "dispatcher"
  members      = local.dispatcher_team
  repositories = local.dispatcher_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
