locals {
  sick_safevisionary_team = [
    "MGBla",
    "lienhjoSICKAG",
    "stefanscherzinger",
  ]
  sick_safevisionary_repositories = [
    "sick_safevisionary_base-release",
    "sick_safevisionary_ros2-release",
  ]
}

module "sick_safevisionary_team" {
  source       = "./modules/release_team"
  team_name    = "sick_safevisionary"
  members      = local.sick_safevisionary_team
  repositories = local.sick_safevisionary_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
