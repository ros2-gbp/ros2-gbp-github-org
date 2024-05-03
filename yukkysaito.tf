locals {
  yukkysaito_team = [
    "yukkysaito",
  ]
  yukkysaito_repositories = [
    "multiple_topic_monitor-release",
  ]
}

module "yukkysaito_team" {
  source       = "./modules/release_team"
  team_name    = "yukkysaito"
  members      = local.yukkysaito_team
  repositories = local.yukkysaito_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
