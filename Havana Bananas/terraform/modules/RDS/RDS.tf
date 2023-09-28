data "aws_secretsmanager_secret" "rds_password" {
  name = "${local.name_con}catalogue-password"

  depends_on = [aws_secretsmanager_secret.rds_password]
}
data "aws_secretsmanager_secret_version" "banana-sock-db-password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id

  depends_on = [aws_secretsmanager_secret_version.banana-sock-db-password]
}

resource "aws_db_instance" "catalogue" {
  db_name                    = "catalogue"
  identifier                 = "${local.name_con}catalogue-db"
  engine                     = "mysql"
  engine_version             = "8.0"
  db_subnet_group_name       = aws_db_subnet_group.rds_group.name
  auto_minor_version_upgrade = true
  multi_az                   = true

  instance_class = "db.t3.micro"

  storage_type            = "gp2"
  allocated_storage       = 20
  storage_encrypted       = true
  backup_retention_period = 0
  skip_final_snapshot     = true
  //final_snapshot_identifier = "db-defunct-rory"

  iam_database_authentication_enabled = false

  username = "admin"
  password = data.aws_secretsmanager_secret_version.banana-sock-db-password.secret_string

  //TODO: update with Amilcar's new sg's
  //vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  //depends_on = [aws_security_group.ec2-sg]

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}catalogue-db" })
  )
}
resource "aws_db_subnet_group" "rds_group" {
  name       = "${var.name_con}rds"
  subnet_ids = var.private_subnet_ids

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}cataloge-db-subnet-group" })
  )
}

data "aws_availability_zones" "available" {
  state = "available"
}


