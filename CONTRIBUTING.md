# Contribution guidelines

Changes to the organization structure are managed by the GitHub Terraform provider and the terraform configurations in this repository.

Each set of repositories is maintained by a release team with a name that matches the repository name (such as `octomap`), or in some cases, the umbrella project which maintains multiple release repositories (such as `navigation` or `tooling_wg`).
Each release team's configuration is stored in its own file: `RELEASE_TEAM.tf` so, for example, configuration for the `tooling_wg` team is stored in `tooling_wg.tf`.


## Creating a new release team

1. Add a new file to the repository named after the release team.
See above the conventions on team names.
Replace the string RELEASE_TEAM in the template below with the name of the release team.

```
locals {
  RELEASE_TEAM_team = [
  ]

  RELEASE_TEAM_repositories = [
  ]
}

module "RELEASE_TEAM" {
  team_name = "RELEASE_TEAM"
  members = local.RELEASE_TEAM_team
  repositories = local.RELEASE_TEAM_repositories
}
```

2. Add the release team to the list of organization members.
In `00-members.tf`

## Updating team membership

Add new member's GitHub username to the `RELEASE_TEAM_team` local variable in `RELEASE_TEAM.tf`.

## Adding new repositories to a release team

Add the repository to the `RELEASE_TEAM_repositories` local variable in `REALEASE_TEAM.tf`.


## Archiving a release repository

When a release repository is no longer being updated, (which can occur when the packages within are no longer maintained or the repository has been reorganized and a new release repository is now being used) archiving the repositroy prevents unintended changes while preserving availability.

1. Remove the repository from the `RELEASE_TEAM_repositories` local variable in `REALEASE_TEAM.tf`.
2. Add the repository to the `archived_repositories` local variable in `00-archived.tf`.

## Unarchiving a release repository.

Repositories may be unarchived if development on a package resumes or if changes to an old release repository need to be performed.
Repositories can not currently be unarchived by the GitHub Terraform provider.

1. Add the repository to the `RELEASE_TEAM_repositories` local variable in `REALEASE_TEAM.tf`.
2. Remove the repository from the `archived_repositories` local variable in `00-archived.tf`.
3. Notify a maintainer of this project that the repository needs to be manually unarchived.


