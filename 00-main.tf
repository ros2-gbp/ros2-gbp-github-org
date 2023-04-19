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
