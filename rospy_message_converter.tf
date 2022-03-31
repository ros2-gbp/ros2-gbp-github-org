locals {
  rospy_message_converter_team = [
    "mintar",
  ]
  rospy_message_converter_repositories = [
    "rospy_message_converter-release",
  ]
}

module "rospy_message_converter_team" {
  source       = "./modules/release_team"
  team_name    = "rospy_message_converter"
  members      = local.rospy_message_converter_team
  repositories = local.rospy_message_converter_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
