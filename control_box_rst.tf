locals {
  control_box_rst_team = [
    "croesmann",
  ]
  control_box_rst_repositories = [
    "control_box_rst-release",
  ]
}

module "control_box_rst_team" {
  source       = "./modules/release_team"
  team_name    = "control_box_rst"
  members      = local.control_box_rst_team
  repositories = local.control_box_rst_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
