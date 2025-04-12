locals {
  ros2_rust_team = [
    "esteve",
  ]
  ros2_rust_repositories = [
    "rosidl_rust-release",
  ]
}

module "ros2_rust_team" {
  source       = "./modules/release_team"
  team_name    = "ros2_rust"
  members      = local.ros2_rust_team
  repositories = local.ros2_rust_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
