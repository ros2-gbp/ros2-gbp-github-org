locals {
  py_trees_team = [
    "stonier",
    "sea-bass",
  ]
  py_trees_repositories = [
    "py_trees-release",
    "py_trees_js-release",
    "py_trees_ros-release",
    "py_trees_ros_interfaces-release",
    "py_trees_ros_tutorials-release",
    "py_trees_ros_viewer-release"
  ]
}

module "py_trees_team" {
  source       = "./modules/release_team"
  team_name    = "py_trees"
  members      = local.py_trees_team
  repositories = local.py_trees_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
