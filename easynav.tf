locals {
  easynav_team = [
    "Butakus",
    "estherag",
    "fmrico",
    "jmguerreroh",
    "juanscelyg",
  ]
  easynav_repositories = [
    "NavMap-release",
    "yaets-release",
  ]
}

module "easynav_team" {
  source       = "./modules/release_team"
  team_name    = "easynav"
  members      = local.easynav_team
  repositories = local.easynav_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
