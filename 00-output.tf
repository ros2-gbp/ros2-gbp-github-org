
output "unmanaged_members" {
  value = setsubtract(
    data.github_organization.ros2-gbp.members,
    setunion(local.ros_admins, local.non_admin_members)
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
