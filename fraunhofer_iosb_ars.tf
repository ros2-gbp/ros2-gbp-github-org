locals {
  fraunhofer_iosb_ars_team = [
    "jpetereit",
    "migranram",
    "rapzag",
    "thomasemter",
  ]
  fraunhofer_iosb_ars_repositories = [
    "camera_aravis2-release",
  ]
}

module "fraunhofer_iosb_ars_team" {
  source       = "./modules/release_team"
  team_name    = "fraunhofer_iosb_ars"
  members      = local.fraunhofer_iosb_ars_team
  repositories = local.fraunhofer_iosb_ars_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
