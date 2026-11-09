locals {
  shmem_buffer_backend_team = [
    "dskkato",
  ]
  shmem_buffer_backend_repositories = [
    "shmem_buffer_backend-release",
  ]
}

module "shmem_buffer_backend_team" {
  source       = "./modules/release_team"
  team_name    = "shmem_buffer_backend"
  members      = local.shmem_buffer_backend_team
  repositories = local.shmem_buffer_backend_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
