locals {
  rmw_unix_socket_cpp_team = [
    "benaliabderrahmane",
  ]
  rmw_unix_socket_cpp_repositories = [
    "rmw_unix_socket_cpp-release",
  ]
}

module "rmw_unix_socket_cpp_team" {
  source       = "./modules/release_team"
  team_name    = "rmw_unix_socket_cpp"
  members      = local.rmw_unix_socket_cpp_team
  repositories = local.rmw_unix_socket_cpp_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
