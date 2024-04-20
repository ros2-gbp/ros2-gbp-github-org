locals {
  ros2_gbp_docs_team = [
    "kscottz",
  ]
}

resource "github_repository" "dotgithub" {
  name       = ".github"
  visibility = "public"
  lifecycle {
    # Plans that destroy repository releases will delete the repository on
    # GitHub and that shouldn't be done in the normal course of operation.
    prevent_destroy = true
    # Ignore fields that are not set or managed by this terraform project
    # to prevent unecessary drift.
    ignore_changes = [
      allow_merge_commit,
      description,
      has_downloads,
      has_projects,
      has_issues,
      has_wiki,
      vulnerability_alerts
    ]
  }
}

resource "github_repository" "release-repository-template" {
  name         = "release-repository-template"
  visibility   = "public"
  is_template  = true
  has_projects = false
  lifecycle {
    # Plans that destroy repository releases will delete the repository on
    # GitHub and that shouldn't be done in the normal course of operation.
    prevent_destroy = true
    # Ignore fields that are not set or managed by this terraform project
    # to prevent unecessary drift.
    ignore_changes = [
      allow_merge_commit,
      description,
      has_downloads,
      has_issues,
      has_wiki,
      vulnerability_alerts
    ]
  }
}

resource "github_team" "docs_team" {
  name                      = "ros2-gbp-docs"
  description               = "ros2-gbp documentation contributors"
  privacy                   = "closed"
  create_default_maintainer = false
}

resource "github_team_membership" "docs_team" {
  for_each = toset(local.ros2_gbp_docs_team)
  team_id  = github_team.docs_team.id
  username = each.value
  role     = "member"
}

resource "github_team_repository" "docs_team" {
  team_id    = github_team.docs_team.id
  repository = github_repository.dotgithub.name
  permission = "maintain"
}
