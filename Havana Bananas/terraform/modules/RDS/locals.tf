locals {
  name_con = var.name_con
  default_tags = {
    Component = "RDS"
    Project = "Havana Bananas"

  }

# Create subnet availability zone map
subnet_az_map = {
  for idx, az in data.aws_availability_zones.available.names : az => {
    # route_table_id = element(aws_route_table.private, idx).id
    subnet_count = length(var.private_subnet_ids)
  }

}
availability_zone_count = length(data.aws_availability_zones.available.names)
}