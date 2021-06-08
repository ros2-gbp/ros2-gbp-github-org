
output "unmanaged_members" {
  value = setsubtract(
    data.github_organization.ros2-gbp.members,
    setunion(
      local.ros_admins,
      local.ros_team,
    )
  )
}

output "unmanaged_repositories" {
  value = setsubtract(
    [for repo in data.github_organization.ros2-gbp.repositories: trimprefix(repo, "ros2-gbp/")],
    setunion(
      local.archived_repositories,
      local.ros_core_repositories,
      local.ros_base_repositories,
      local.ros_desktop_repositories,
      local.ros_team_repositories,
      local.rqt_repositories,
    )
  )
}
