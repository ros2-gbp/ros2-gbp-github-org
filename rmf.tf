locals {
  rmf_team = [
    "Yadunund",
    "codebot",
    "luca-della-vedova",
    "marcoag",
  ]
  rmf_repositories = [
    "ament_cmake_catch2-release",
    "menge_vendor-release",
    "nlohmann_json_schema_validator_vendor-release",
    "pybind11_json_vendor-release",
    "rmf_api_msgs-release",
    "rmf_battery-release",
    "rmf_building_map_msgs-release",
    "rmf_cmake_uncrustify-release",
    "rmf_demos-release",
    "rmf_internal_msgs-release",
    "rmf_ros2-release",
    "rmf_simulation-release",
    "rmf_task-release",
    "rmf_traffic-release",
    "rmf_traffic_editor-release",
    "rmf_utils-release",
    "rmf_variants-release",
    "rmf_visualization-release",
    "rmf_visualization_msgs-release",
    "stubborn_buddies-release",
  ]
}

module "rmf_team" {
  source       = "./modules/release_team"
  team_name    = "rmf"
  members      = local.rmf_team
  repositories = local.rmf_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
