locals {
  async_web_server_cpp_team = [
    "roehling",
  ]
  async_web_server_cpp_repositories = [
    "async_web_server_cpp-release",
    "async_web_server_cpp-release",
  ]
}

module "async_web_server_cpp_team" {
  source       = "./modules/release_team"
  team_name    = "async_web_server_cpp"
  members      = local.async_web_server_cpp_team
  repositories = local.async_web_server_cpp_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
