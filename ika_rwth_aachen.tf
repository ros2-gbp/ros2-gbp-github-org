locals {
  ika_rwth_aachen_team = [
    "lreiher",
  ]
  ika_rwth_aachen_repositories = [
    "message_tf_frame_transformer-release",
    "mqtt_client-release",
  ]
}

module "ika_rwth_aachen_team" {
  source       = "./modules/release_team"
  team_name    = "ika_rwth_aachen"
  members      = local.ika_rwth_aachen_team
  repositories = local.ika_rwth_aachen_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
