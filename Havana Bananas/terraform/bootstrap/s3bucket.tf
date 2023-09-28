resource "aws_s3_bucket" "havana_banana_remote_state" {
    bucket = "${var.name_con}bucket"
    

    lifecycle {
     prevent_destroy = true
   }

     tags = {
    Name        = "${var.name_con}bucket"
    Environment = "Prod"
  }

}