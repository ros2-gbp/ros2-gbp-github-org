locals {
  impedance_control_team = [
    "qleonardolp",
  ]
  impedance_control_repositories = [
    "kinematic_pose_msgs-release",
  ]
}

module "impedance_control_team" {
  source       = "./modules/release_team"
  team_name    = "impedance_control"
  members      = local.impedance_control_team
  repositories = local.impedance_control_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
