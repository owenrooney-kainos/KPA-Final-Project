### CREATE AN INTERNET GATEWAY AND ATTACH TO VPC###
resource "aws_internet_gateway" "banana_sock_igw" {
  vpc_id = aws_vpc.banana-sock-vpc.id
}

### elastic IP for NAT Gateway A ###

resource "aws_eip" "ip-nat-gw" {
  count = var.nat_count

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}eip-${count.index}",
    "Az" = "${data.aws_availability_zones.available.names[count.index % local.availability_zone_count]}" })
  )
}
### create a nat gateway  ###
resource "aws_nat_gateway" "banana_sock_nat" {
  count         = var.nat_count
  subnet_id     = aws_subnet.public[count.index].id
  allocation_id = aws_eip.ip-nat-gw[count.index].id

  depends_on = [aws_internet_gateway.banana_sock_igw]
  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}nat-${count.index}",
    "Az" = "${data.aws_availability_zones.available.names[count.index % local.availability_zone_count]}" })
  )

}


