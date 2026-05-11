locals {
  accelerated_memory_transports_team = [
    "karsten-nvidia",
    "nvcyc",
    "yuanknv",
  ]
  accelerated_memory_transports_repositories = [
    "rosidl_buffer_backends-release",
    "rosidl_buffer_backends_tutorials-release",
  ]
}

module "accelerated_memory_transports_team" {
  source       = "./modules/release_team"
  team_name    = "accelerated_memory_transports"
  members      = local.accelerated_memory_transports_team
  repositories = local.accelerated_memory_transports_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
