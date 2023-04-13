locals {
  maliput_team = [
    "agalbachicar",
    "francocipollone",
    "tfoote",
    "Voldivh",
  ]
  maliput_repositories = [
    "maliput-release",
    "maliput_documentation-release",
    "maliput_dragway-release",
    "maliput_drake-release",
    "maliput_infrastructure-release",
    "maliput_integration-release",
    "maliput_integration_tests-release",
    "maliput_malidrive-release",
    "maliput_multilane-release",
    "maliput_object-release",
    "maliput_object_py-release",
    "maliput_osm-release",
    "maliput_py-release",
    "maliput_ros",
    "maliput_ros_interfaces",
    "maliput_ros_translation",
    "maliput_sparse-release",
    "maliput_viz-release",
  ]
}

module "maliput_team" {
  source       = "./modules/release_team"
  team_name    = "maliput"
  members      = local.maliput_team
  repositories = local.maliput_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
