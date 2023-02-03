variable "asg_configurations" {
  description = "Configs for auto scaling group"
  default = {
    test-app = {
      min_size              = 2
      max_size              = 2
      desired_capacity      = 2
      instance_type         = "t3a.medium"
      root_volume_size      = 10
      secondary_volume_size = 10
    }
  }
}

variable "ami_name" {
  description = "Name of ami to be used by launch template"
  default     = ["cis-base-app-golden-ami-13-10-2021"]
}
