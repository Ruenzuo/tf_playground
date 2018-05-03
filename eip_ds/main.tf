provider "aws" {
  region = "us-west-2"
}

data "aws_eip" "tf_playground_instance_eip" {
  id = "eipalloc-0a88322d949785907"
}

output "aws_eip_tf_playground_instance_eip" {
  value = "${data.aws_eip.tf_playground_instance_eip.public_ip}"
}
