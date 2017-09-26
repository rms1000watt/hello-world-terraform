variable "aws-keypair-name" {
  description = "Name of AWS key pair to use or create"
  default     = "test-keypair"
}

variable "aws-public-key" {
  description = "Full filepath of AWS public SSH key to connect with"
  default = "~/.ssh/test-keypair.pub"
}

variable "aws-private-key" {
  description = "Full filepath of AWS private key to connect with"
  default     = "~/.ssh/test-keypair.pem"
}

variable "aws-region" {
  description = "AWS region to launch servers"
  default     = "us-west-2"
}

variable "aws-amis" {
  default = {
    us-west-2 = "ami-6e1a0117"
  }
}
