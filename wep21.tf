locals {
  wep21_team = [
    "wep21",
  ]
  wep21_repositories = [
    "bag2_to_image-release",
    "turbojpeg_compressed_image_transport-release",
  ]
}

module "wep21_team" {
  source       = "./modules/release_team"
  team_name    = "wep21"
  members      = local.wep21_team
  repositories = local.wep21_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
