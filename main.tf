provider "aws" {
  region = "${var.aws-region}"
}

resource "aws_vpc" "test-vpc-01" {
  cidr_block = "10.0.0.0/16"
  
  tags {
    Name = "test-vpc-01"
  }
}

resource "aws_internet_gateway" "test-igtwy-01" {
  vpc_id = "${aws_vpc.test-vpc-01.id}"
}

resource "aws_route" "test-route-01" {
  route_table_id         = "${aws_vpc.test-vpc-01.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.test-igtwy-01.id}"
}


resource "aws_subnet" "test-snet-01" {
  vpc_id     = "${aws_vpc.test-vpc-01.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "test-snet-01"
  }
}

resource "aws_security_group" "test-sg-01" {
  name        = "test-sg-01"
  description = "Test Security Group 1"
  vpc_id      = "${aws_vpc.test-vpc-01.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "test-sg-01"
  }
}

resource "aws_instance" "test-ubuntu-01" {
  connection {
    user        = "ubuntu"
    private_key = "${file(var.aws-private-key)}"
  }

  instance_type = "t2.nano"
  ami           = "${lookup(var.aws-amis, var.aws-region)}"

  key_name = "${var.aws-keypair-name}"

  vpc_security_group_ids = ["${aws_security_group.test-sg-01.id}"]
  subnet_id              = "${aws_subnet.test-snet-01.id}"

  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello World'",
    ]
  }

  tags {
    Name = "test-ubuntu-01"
  }
}
