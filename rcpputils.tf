locals {
  rcpputils_team = [
    "emersonknapp",
    "prajakta-gokhale",
    "thomas-moulard",
  ]
  rcpputils_repositories = [
    "rcpputils-release"
  ]
}

module "rcpputils_team" {
  source = "./modules/release_team"
  team_name = "rcpputils"
  members = local.rcpputils_team
  repositories = local.rcpputils_repositories
}

