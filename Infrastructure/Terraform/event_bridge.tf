resource "aws_scheduler_schedule" "Crypto-Lambda-Scheduler" {
  name = "Crypto-Lambda-Scheduler"
  group_name = "default"

  flexible_time_window {
    mode = "OFF"
  }
  schedule_expression = "rate(10 minutes)"

  target{
    arn = aws_lambda_function.crypto_lambda.arn
    role_arn = aws_iam_role.lambda_scheduler_role.arn
  }
}