locals {
  locusrobotics_team = [
    "ayrton04",
    "svwilliams",
  ]
  locusrobotics_repositories = [
    "fuse-release",
    "tf2_2d-release",
  ]
}

module "locusrobotics_team" {
  source       = "./modules/release_team"
  team_name    = "locusrobotics"
  members      = local.locusrobotics_team
  repositories = local.locusrobotics_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}
