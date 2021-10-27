locals {
  locator_ros_bridge_team = [
  ]
  locator_ros_bridge_repositories = [
    "locator_ros_bridge-release",
  ]
}

module "locator_ros_bridge_team" {
  source = "./modules/release_team"
  team_name = "locator_ros_bridge"
  members = local.locator_ros_bridge_team
  repositories = local.locator_ros_bridge_repositories
}
