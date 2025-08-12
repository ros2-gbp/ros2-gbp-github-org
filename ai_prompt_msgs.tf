locals {
  ai_prompt_msgs_team = [
    "AndyZe",
  ]
  ai_prompt_msgs_repositories = [
    "ai_prompt_msgs-release",
    "robosoft_openai-release",
  ]
}

module "ai_prompt_msgs_team" {
  source       = "./modules/release_team"
  team_name    = "ai_prompt_msgs"
  members      = local.ai_prompt_msgs_team
  repositories = local.ai_prompt_msgs_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
