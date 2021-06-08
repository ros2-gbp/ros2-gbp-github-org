data "github_organization" "ros2-gbp" {
  name = "ros2-gbp"
}

locals {
  ros_admins = [
    "clalancette",
    "cottsay",
    "nuclearsandwich",
    "tfoote",
  ]
  ros_team = [
    "ahcorde",
    "audrow",
    "Blast545", #TODO check status
    "BMarchi", #TODO check status
    "chapulina",
    "gonzodepedro",
    "hidmic",
    "ivanpauno",
    "j-rivero",
    "jacobperron",
    "Karsten1987",
    "Lobotuerk",
    "mabelzhang",
    "mjcarroll",
    "mjeronimo",
    "sloretz",
    "wjwwood",
  ]
}

resource "github_membership" "ros_admins" {
  for_each = toset(local.ros_admins)
  username = each.value
  role = "admin"
}

resource "github_membership" "ros_team" {
  for_each = toset(local.ros_team)
  username = each.value
  role = "member"
}

