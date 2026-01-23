locals {
  tf_tree_terminal_team = [
    "Tanneguydv",
  ]
  tf_tree_terminal_repositories = [
    "tf_tree_terminal-release",
  ]
}

module "tf_tree_terminal_team" {
  source       = "./modules/release_team"
  team_name    = "tf_tree_terminal"
  members      = local.tf_tree_terminal_team
  repositories = local.tf_tree_terminal_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
