resource "aws_iam_role" "crypto_role" {
    name = "crypto_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
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