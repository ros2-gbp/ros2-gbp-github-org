locals {
  uw_graphics_team = [
    "cpsiff",
  ]
  uw_graphics_repositories = [
    "mini_tof-release",
    "mini_tof_interfaces-release",
  ]
}

module "uw_graphics_team" {
  source       = "./modules/release_team"
  team_name    = "uw_graphics"
  members      = local.uw_graphics_team
  repositories = local.uw_graphics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
