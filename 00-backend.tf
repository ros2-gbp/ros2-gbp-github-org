terraform {
  backend "s3" {
    bucket         = "osrf-tf-state"
    key            = "github.ros2-gbp"
    region         = "us-east-1"
    dynamodb_table = "osrf-tf-state"
  }
}
