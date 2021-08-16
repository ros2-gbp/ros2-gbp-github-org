data "github_organization" "ros2-gbp" {
  name = "ros2-gbp"
}

data "github_organization_teams" "ros2-gbp" {}

locals {
  ros_admins = [
    "clalancette",
    "cottsay",
    "nuclearsandwich",
    "tfoote",
  ]
}

resource "github_membership" "ros_admins" {
  for_each = toset(local.ros_admins)
  username = each.value
  role = "admin"
}

