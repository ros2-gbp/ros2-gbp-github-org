locals {
  py_binding_tools_team = [
    "rhaschke",
  ]
  py_binding_tools_repositories = [
    "py_binding_tools-release",
  ]
}

module "py_binding_tools_team" {
  source       = "./modules/release_team"
  team_name    = "py_binding_tools"
  members      = local.py_binding_tools_team
  repositories = local.py_binding_tools_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
