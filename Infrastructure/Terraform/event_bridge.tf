resource "aws_scheduler_schedule" "Crypto-Lambda-Scheduler" {
  name = "Crypto-Lambda-Scheduler"
  group_name = "default"

  flexible_time_window {
    mode = "OFF"
  }
  schedule_expression = "rate(10 minutes)"

  target{
    arn = aws_lambda_function.lambda_function.arn
    role_arn = aws_iam_role.crypto_role.arn
  }
}