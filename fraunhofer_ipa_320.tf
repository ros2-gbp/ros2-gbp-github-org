locals {
  fraunhofer_ipa_320_team = [
    "ottojo",
  ]
  fraunhofer_ipa_320_repositories = [
    "ros_battery_monitoring-release",
  ]
}

module "fraunhofer_ipa_320_team" {
  source       = "./modules/release_team"
  team_name    = "fraunhofer_ipa_320"
  members      = local.fraunhofer_ipa_320_team
  repositories = local.fraunhofer_ipa_320_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
