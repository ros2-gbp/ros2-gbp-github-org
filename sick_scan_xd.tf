locals {
  sick_scan_xd_team = [
    "michael109",
    "rostest",
  ]
  sick_scan_xd_repositories = [
    "sick_scan_xd-release",
  ]
}

module "sick_scan_xd_team" {
  source       = "./modules/release_team"
  team_name    = "sick_scan_xd"
  members      = local.sick_scan_xd_team
  repositories = local.sick_scan_xd_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
