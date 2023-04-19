data "github_organization" "ros2-gbp" {
  name = "ros2-gbp"
}

data "github_organization_teams" "ros2-gbp" {}

locals {
  ros_admins = [
    "audrow",
    "clalancette",
    "cottsay",
    "nuclearsandwich",
    "tfoote",
    "Yadunund",
  ]
}

resource "github_membership" "ros_admins" {
  for_each = toset(local.ros_admins)
  username = each.value
  role     = "admin"
}

