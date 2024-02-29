locals {
  moveit_team = [
    "JafarAbdi",
    "christhrasher",
    "henningkayser",
    "rhaschke",
    "sjahr",
    "tylerjw",
    "v4hn",
    "vatanaksoytezer",
  ]
  moveit_repositories = [
    "generate_parameter_library-release",
    "geometric_shapes-release",
    "moveit2-release",
    "moveit_msgs-release",
    "moveit_resources-release",
    "moveit_task_constructor-release",
    "moveit_visual_tools-release",
    "pick_ik-release",
    "random_numbers-release",
    "rsl-release",
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
  depends_on   = [github_membership.members, github_repository.repositories]
}
