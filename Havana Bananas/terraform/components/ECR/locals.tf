locals {
  ecr_lifecycle_policy_document = <<EOF
    {
        "rules": [
            {
                "rulePriority": 1,
                "description": "Expire images older than 14 days",
                "selection": {
                    "tagStatus": "untagged",
                    "countType": "sinceImagePushed",
                    "countUnit": "days",
                    "countNumber": 14
                },
                "action": {
                    "type": "expire"
                }
            }
        ]
    }
    EOF

  ecr_iam_policy_documet = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "ECRRepositoryPolicy",
                "Effect": "Allow",
                "Principal": {"AWS": "156460612806"},
                "Action": [
                    "ecr:DescribeImages",
                    "ecr:DescribeRepositories",
                    "ecr:ListImages"
                ]
            }
        ]
    }
    EOF

}