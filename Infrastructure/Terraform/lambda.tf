data "archive_file" "lambda" {
    type = "zip"
    source_file = "../../Data_Extraction/lambda_function.py"
    output_path = "/lambda_function.zip"
}

resource "aws_lambda_function" "lambda_function" {
    function_name = "Crypto_Lambda_Function"
    filename = data.archive_file.lambda.output_path
    role = aws_iam_role.crypto_role.arn
    runtime = "python3.12"
    handler = "lambda_function.lambda_handler"
}