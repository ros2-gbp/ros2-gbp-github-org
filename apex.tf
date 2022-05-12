locals {
  apex_team = [
    "carlossvg",
    "flynneva",
    "erikatapex",
    "revati-naik",
  ]
  apex_repositories = [
    "apex_containers-release",
    "apex_test_tools-release",
    "point_cloud_msg_wrapper-release",
    "performance_test-release",
  ]
}

module "apex_team" {
  source       = "./modules/release_team"
  team_name    = "apex"
  members      = local.apex_team
  repositories = local.apex_repositories
}
