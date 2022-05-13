locals {
  apex_team = [
    "LanderU",
    "carlossvg",
    "erikatapex",
    "flynneva",
    "revati-naik",
  ]
  apex_repositories = [
    "apex_containers-release",
    "apex_test_tools-release",
    "performance_test-release",
    "point_cloud_msg_wrapper-release",
  ]
}

module "apex_team" {
  source       = "./modules/release_team"
  team_name    = "apex"
  members      = local.apex_team
  repositories = local.apex_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
