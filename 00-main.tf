data "github_organization" "ros2-gbp" {
  name = "ros2-gbp"
}

data "github_organization_teams" "ros2-gbp" {}

locals {
  ros_admins = [
    # keep-sorted start
    "Yadunund",
    "audrow",
    "clalancette",
    "cottsay",
    "marcoag",
    "nuclearsandwich",
    "tfoote",
    # keep-sorted end
  ]
}
