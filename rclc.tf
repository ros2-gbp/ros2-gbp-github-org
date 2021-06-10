locals {
  rclc_team = [
    "JanStatschulat",
  ]
  rclc_repositories = [
    "rclc-release",
  ]
}

module "rclc_team" {
  source = "./modules/release_team"
  team_name = "rclc"
  members = local.rclc_team
  repositories = local.rclc_team
}
