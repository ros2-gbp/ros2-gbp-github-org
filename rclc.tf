locals {
  rclc_team = [
    "JanStaschulat",
    "pablogs9",
  ]
  rclc_repositories = [
    "rclc-release",
  ]
}

module "rclc_team" {
  source       = "./modules/release_team"
  team_name    = "rclc"
  members      = local.rclc_team
  repositories = local.rclc_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
