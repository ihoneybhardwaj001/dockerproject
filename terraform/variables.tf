variable "region" {
  default = "us-east-1"
}

variable "ami" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 for us-east-1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name"
}

variable "project_name" {
  default = "flask-express-app"
}
