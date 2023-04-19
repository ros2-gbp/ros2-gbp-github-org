
output "unmanaged_members" {
  value = setsubtract(
    [for member in data.github_organization.ros2-gbp.members : lower(member)],
    [for member in local.members : lower(member)]
  )
}

#output "teams" {
#  value = [for t in data.github_organization_teams.ros2-gbp.teams: t.slug]
#}

output "unmanaged_repositories" {
  value = setsubtract(
    [for repo in data.github_organization.ros2-gbp.repositories : trimprefix(repo, "ros2-gbp/")],
    setunion(local.organization_repositories, ["ros2-gbp-github-org"])
  )
}
