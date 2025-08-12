locals {
  canboat_vendor_team = [
    "Severn-J-Lortie",
  ]
  canboat_vendor_repositories = [
    "canboat_vendor-release",
  ]
}

module "canboat_vendor_team" {
  source       = "./modules/release_team"
  team_name    = "canboat_vendor"
  members      = local.canboat_vendor_team
  repositories = local.canboat_vendor_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
