locals {
  bob_team = [
    "bob-ros2",
  ]
  bob_repositories = [
    "bob_llm-release",
  ]
}

module "bob_team" {
  source       = "./modules/release_team"
  team_name    = "bob"
  members      = local.bob_team
  repositories = local.bob_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
