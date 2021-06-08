
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
    data.github_organization.ros2-gbp.repositories,
    setunion(
      local.ros_core_repositories,
      local.ros_base_repositories,
      local.ros_desktop_repositories,
      local.rqt_repositories,
    )
  )
}
