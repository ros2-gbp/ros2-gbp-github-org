locals {
  behaviortree_team = [
    "facontidavide",
  ]
  behaviortree_repositories = [
    "behaviortree_cpp-release",
  ]
}

module "behaviortree_team" {
  source = "./modules/release_team"
  team_name = "behaviortree"
  members = local.behaviortree_team
  repositories = local.behaviortree_repositories
}
