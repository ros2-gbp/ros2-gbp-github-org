locals {
  rosidlcpp_team = [
    "TonyWelte",
  ]
  rosidlcpp_repositories = [
    "rosidlcpp-release",
  ]
}

module "rosidlcpp_team" {
  source       = "./modules/release_team"
  team_name    = "rosidlcpp"
  members      = local.rosidlcpp_team
  repositories = local.rosidlcpp_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
