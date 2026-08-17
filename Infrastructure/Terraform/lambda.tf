resource "aws_lambda_function" "lambda_function" {
    filename = "../../Data_Extraction/lambda_function.py"
    function_name = "Crypto_Lambda_Function"
    role = aws_iam_role.crypto_role.arn
    runtime = "python3.12"
    handler = "lambda_function.lambda_handler"
}