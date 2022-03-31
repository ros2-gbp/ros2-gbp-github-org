locals {
  fmi_team = [
    "ralph-lange",
  ]
  fmi_repositories = [
    "fmi_adapter-release",
    "fmilibrary_vendor-release",
  ]
}

module "fmi_team" {
  source       = "./modules/release_team"
  team_name    = "fmi"
  members      = local.fmi_team
  repositories = local.fmi_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
