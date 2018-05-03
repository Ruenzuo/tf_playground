provider "aws" {
  region  = "us-west-2"
  version = "1.17.1"
}

data "aws_eip" "tf_playground_instance_eip" {
  filter {
    name   = "tag:Name"
    values = ["tf_playground_instance_eip"]
  }
}

output "aws_eip_tf_playground_instance_eip" {
  value = "${data.aws_eip.tf_playground_instance_eip.public_ip}"
}
