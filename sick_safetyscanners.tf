locals {
  sick_safetyscanners_team = [
    "lenpuc",
  ]
  sick_safetyscanners_repositories = [
    "sick_safetyscanners2-release",
    "sick_safetyscanners2_interfaces-release",
    "sick_safetyscanners_base-release",
  ]
}

module "sick_safetyscanners_team" {
  source       = "./modules/release_team"
  team_name    = "sick_safetyscanners"
  members      = local.sick_safetyscanners_team
  repositories = local.sick_safetyscanners_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
