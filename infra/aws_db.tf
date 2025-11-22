resource "aws_dynamodb_table" "visitor_count" {
  name           = "VisitorCount"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_iam_user" "function_user" {
  name = "gcp-function-user"
}

resource "aws_iam_access_key" "function_key" {
  user = aws_iam_user.function_user.name
}

resource "aws_iam_user_policy" "dynamodb_policy" {
  name = "dynamodb-access"
  user = aws_iam_user.function_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.visitor_count.arn
      },
    ]
  })
}
