/*
resource "aws_lb" "banana_sock_alb" {
  name               = "${var.name_con}alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups = [aws_security_group.alb_sg.id]

  tags = {
    Name = "${var.name_con}alb"
  }
}
*/
resource "aws_lb" "nlb" {
    name               = "${var.name_con}nlb"
    internal           = false
    load_balancer_type = "network"
    subnets            = var.public_subnet_ids
    //security_groups = [aws_security_group.alb_sg.id]

tags = {
    Name = "${var.name_con}nlb"
  }
}