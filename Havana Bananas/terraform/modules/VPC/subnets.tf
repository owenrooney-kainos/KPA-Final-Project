resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.banana-sock-vpc.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % local.availability_zone_count]


  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}public-subnet-${count.index}",
            "Az" = "${data.aws_availability_zones.available.names[count.index % local.availability_zone_count]}" })
  )

}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.banana-sock-vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % local.availability_zone_count]

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}private-subnet-${count.index}",
    "Az" = "${data.aws_availability_zones.available.names[count.index % local.availability_zone_count]}" })
  )
}
data "aws_availability_zones" "available" {
  state = "available"
}

