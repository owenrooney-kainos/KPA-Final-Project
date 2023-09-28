resource "aws_instance" "banana_sock_ec2" {
  count = var.instance_count

  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[count.index % length(var.public_subnets)]
  associate_public_ip_address = true

 user_data = <<EOF
  #!/bin/bash
  sudo su
  sudo apt update -y
  sudo apt install apache2 -y
  echo "<h1>loading from $(hostname -f)..</h1>" > /var/www/html/index.html

  EOF

  security_groups = [var.ec2_sg_id]

  tags = {
    Name = "${var.name_con}${count.index}"
}
}