locals {
  executive_smach_team = [
    "130s",
  ]
  executive_smach_repositories = [
    "executive_smach-release",
  ]
}

module "executive_smach_team" {
  source       = "./modules/release_team"
  team_name    = "executive_smach"
  members      = local.executive_smach_team
  repositories = local.executive_smach_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
