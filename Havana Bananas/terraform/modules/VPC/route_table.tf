resource "aws_route_table" "public" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.banana-sock-vpc.id

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}public_routetable-${count.index}" })
  )
}

resource "aws_route_table" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.banana-sock-vpc.id

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}private_route_table-${count.index}" })
  )
}