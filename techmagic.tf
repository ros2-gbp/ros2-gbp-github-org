locals {
  techmagic_team = [
    "Kansea",
    "XiandiShan",
    "longjie0723",
    "s000ne",
  ]
  techmagic_repositories = [
    "aandd_ekew_driver_py-release",
    "weight_scale_interfaces-release",
  ]
}

module "techmagic_team" {
  source       = "./modules/release_team"
  team_name    = "techmagic"
  members      = local.techmagic_team
  repositories = local.techmagic_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
