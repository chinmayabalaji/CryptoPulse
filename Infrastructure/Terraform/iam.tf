resource "aws_iam_role" "crypto_role" {
    name = "crypto_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = ["lambda.amazonaws.com","scheduler.amazonaws.com", "redshift-serverless.amazonaws.com"]
                    
                }
            },
        ]
    })
}

resource "aws_iam_role_policy_attachment" "lambda_permissions" {
    role = aws_iam_role.crypto_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "lamda_s3_policy" {
    name = "cryptolake-s3-policy"
    role = aws_iam_role.crypto_role.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect = "Allow"
            Action = [
                "s3:PutObject"
            ]
            Resource = "arn:aws:s3:::dev-cryptolake/*"
        }]
    })
}

resource "aws_iam_role_policy" "scheduler_lambda_policy" {
    name = "scheduler-invoke-lambda-policy"
    role = aws_iam_role.crypto_role.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect = "Allow"
            Action = [
                "lambda:InvokeFunction"
            ]
            Resource = aws_lambda_function.lambda_function.arn
        }]
    })
}

resource "aws_iam_role_policy" "redshiftserverless_policy" {
    name = "redshiftserverless-policy"
    role = aws_iam_role.crypto_role.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect = "Allow"
            Action = [
                "redshift-serverless:GetCredentials",
                "redshift-serverless:CreateEndpointAccess",
                "redshift-serverless:DeleteEndpointAccess",
                "redshift-serverless:ListEndpointAccess",
                "redshift-serverless:GetWorkgroup",
                "redshift-serverless:ListWorkgroups"
            ]
            Resource = "*"
        }]
    })
}

resource "aws_iam_role_policy_attachment" "redshiftserverless_permissions" {
    role = aws_iam_role.crypto_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftFullAccess"
}