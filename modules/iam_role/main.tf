
resource "aws_iam_role" "lambda_role" {
  name = "govos-genai-poc-user-lambdat"
  
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.lambda_role.name
}

resource "aws_iam_role_policy_attachment" "sns_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
  role       = aws_iam_role.lambda_role.name
}
resource "aws_iam_role_policy_attachment" "eventbridge_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
  role       = aws_iam_role.lambda_role.name
}

# resource "aws_iam_role_policy_attachment" "sns_read_only_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSNSReadOnlyAccess"
#   role       = aws_iam_role.lambda_role.name
# }

resource "aws_iam_role_policy_attachment" "sqs_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  role       = aws_iam_role.lambda_role.name
}
resource "aws_iam_role_policy_attachment" "dynamodb_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = aws_iam_role.lambda_role.name
}
resource "aws_iam_role_policy_attachment" "bedrock_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonBedrockFullAccess"
  role       = aws_iam_role.lambda_role.name
}
resource "aws_iam_role_policy_attachment" "sqs_read_only_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSReadOnlyAccess"
  role       = aws_iam_role.lambda_role.name
}

resource "aws_iam_role_policy_attachment" "textract_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonTextractFullAccess"
  role       = aws_iam_role.lambda_role.name
}

resource "aws_iam_role_policy_attachment" "lambda_sqs_execution_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
  role       = aws_iam_role.lambda_role.name
}
resource "aws_iam_role_policy_attachment" "apigateway_administrator" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
  role       = aws_iam_role.lambda_role.name
}
output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}
