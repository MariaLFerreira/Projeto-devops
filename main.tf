terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
      }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region = lookup(var.awsprops, "region")
}

resource "aws_security_group" "kube-sg" {
    name = lookup(var.awsprops, "secgroupname")
    description = lookup(var.awsprops, "secgroupname")
    vpc_id = "vpc-06a8c2f9f11a5235c"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "ec2instance-worker1" {
  value = aws_instance.kubernetes-worker1.public_ip
}

resource "aws_instance" "kubernetes-worker2" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  key_name      = "kube.pub" 
  tags = {
    name = "k8s"
    type = "worker"
  }

  security_groups = ["${aws_security_group.kube-sg.name}"]
  depends_on = [ aws_security_group.kube-sg ]

} 

output "ec2instance-worker2" {
  value = aws_instance.kubernetes-worker2.public_ip
}

resource "aws_instance" "kubernetes-master" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  #subnet_id = lookup(var.awsprops, "subnet")
  key_name      = "kube.pub" 
  #count         = 1
  tags = {
    name = "k8s"
    type = "master"
  }
  security_groups = ["${aws_security_group.kube-sg.name}"]
  depends_on = [ aws_security_group.kube-sg ]

} 

output "ec2instance-master" {
  value = aws_instance.kubernetes-master.public_ip
}



