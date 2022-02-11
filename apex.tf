locals {
  apex_team = [
    "carlossvg",
  ]
  apex_repositories = [
    "apex_containers-release",
    "apex_test_tools-release",
    "point_cloud_msg_wrapper-release",
  ]
}

module "apex_team" {
  source = "./modules/release_team"
  team_name = "apex"
  members = local.apex_team
  repositories = local.apex_repositories
}
