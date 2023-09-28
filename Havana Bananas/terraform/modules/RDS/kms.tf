resource "random_password" "banana-sock-secret-rng" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "rds_password" {
  name = "${local.name_con}catalogue-password"
}

resource "aws_secretsmanager_secret_version" "banana-sock-db-password" {
  secret_id     = aws_secretsmanager_secret.rds_password.id
  secret_string = random_password.banana-sock-secret-rng.result
}