locals {
  sony_rdc_team = [
    "Barry-Xu-2018",
    "fujitatomoya",
  ]
  sony_rdc_repositories = [
    "rcl_logging_syslog-release",
    "service_load_balancing-release",
  ]
}

module "sony_rdc_team" {
  source       = "./modules/release_team"
  team_name    = "sony_rdc"
  members      = local.sony_rdc_team
  repositories = local.sony_rdc_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
