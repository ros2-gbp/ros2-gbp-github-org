variable "team_name" {
  description = "Name of the release team on GitHub."
  type = string
}

variable "members" {
  description = "GitHub usernames of the release team members."
  type = list(string)
}

variable "repositories" {
  description = "List of release repositories managed by this team."
  type = list(string)
}

