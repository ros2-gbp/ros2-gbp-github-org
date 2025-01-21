data "github_organization" "ros2-gbp" {
  name = "ros2-gbp"
}

data "github_organization_teams" "ros2-gbp" {}

locals {
  ros_admins = [
    "Yadunund",
    "audrow",
    "clalancette",
    "cottsay",
    "gbiggs",
    "marcoag",
    "nuclearsandwich",
    "tfoote",
    "vyorsi",
  ]
}
