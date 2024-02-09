locals {
  boeing_team = [
    "RoBeau",
    "brta-jc",
    "derme302",
  ]
  boeing_repositories = [
    "boeing_gazebo_model_attachement_plugin-release",
    "gazebo_no_physics_plugin-release",
    "gazebo_planar_move_plugin-release",
    "gazebo_set_joint_positions_plugin-release",
  ]
}

module "boeing_team" {
  source       = "./modules/release_team"
  team_name    = "boeing"
  members      = local.boeing_team
  repositories = local.boeing_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
