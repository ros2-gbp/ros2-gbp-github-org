
output "unmanaged_members" {
  value = setsubtract(
    data.github_organization.ros2-gbp.members,
    setunion(
      local.ros_admins,
      local.ros_team,
      local.apriltag_team,
      local.apex_team,
      local.autoware_team,
      local.behaviortree_team,
      local.cyclonedds_team,
      local.diagnostics_team,
      local.fmi_team,
      local.nodl_team,
      local.rosbag2_team,

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
      local.apex_repositories,
      local.apriltag_repositories,
      local.autoware_repositories,
      local.behaviortree_repositories,
      local.cyclonedds_repositories,
      local.diagnostics_repositories,
      local.fmi_repositories,
      local.nodl_repositories,
      local.rosbag2_repositories,
    )
  )
}
