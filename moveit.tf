locals {
  moveit_team = [
    "JafarAbdi",
    "henningkayser",
    "rhaschke",
    "tylerjw",
    "v4hn",
    "vatanaksoytezer",
  ]
  moveit_repositories = [
    "geometric_shapes-release",
    "moveit2-release",
    "moveit_msgs-release",
    "moveit_resources-release",
    "moveit_visual_tools-release",
    "random_numbers-release",
    "srdfdom-release",
    "warehouse_ros-release",
    "warehouse_ros_mongo-release",
    "warehouse_ros_sqlite-release",
  ]
}

module "moveit_team" {
  source       = "./modules/release_team"
  team_name    = "moveit"
  members      = local.moveit_team
  repositories = local.moveit_repositories
}
