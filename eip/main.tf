provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "packer_created" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-created-*"]
  }

  owners = ["self"]
}

output "aws_ami_packer_created_id" {
  value = "${data.aws_ami.packer_created.image_id}"
}

resource "aws_instance" "tf_playground_instance" {
  ami           = "${data.aws_ami.packer_created.id}"
  instance_type = "t2.micro"

  tags {
    Name = "tf_playground"
  }
}

output "aws_instance_tf_playground_instance_id" {
  value = "${aws_instance.tf_playground_instance.id}"
}

resource "aws_eip" "tf_playground_instance_eip" {
  instance = "${aws_instance.tf_playground_instance.id}"
  vpc      = true

  tags {
    Name = "tf_playground_instance_eip"
  }
}

output "aws_eip_tf_playground_instance_eip" {
  value = "${aws_eip.tf_playground_instance_eip.id}"
}
