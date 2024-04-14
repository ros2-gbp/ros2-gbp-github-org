locals {
  nobleo_team = [
    "Timple",
  ]
  nobleo_repositories = [
    "azure_iot_sdk_c-release",
    "libnabo-release",
    "libpointmatcher-release",
    "magic_enum-release",
    "rtcm_msgs-release",
  ]
}

module "nobleo_team" {
  source       = "./modules/release_team"
  team_name    = "nobleo"
  members      = local.nobleo_team
  repositories = local.nobleo_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
