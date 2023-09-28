locals {
  name_con = var.name_con
  default_tags = {
    Component = "VPC",
    Project   = "Havana Bananas"
  }

  subnet_az_map = {
    for idx, az in data.aws_availability_zones.available.names : az => {
      # route_table_id = element(aws_route_table.private, idx).id
      subnet_count = length([for s in aws_subnet.private : s if s.availability_zone == az])
    }

  }
  availability_zone_count = length(data.aws_availability_zones.available.names)
}