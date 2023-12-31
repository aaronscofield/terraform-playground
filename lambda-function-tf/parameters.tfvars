runtime         = "python3.9"
zipfile         = "lambda.zip"
architecture    = "arm64"
handler         = "function.handler"
lambda_name     = "aarons-lambda-function"
schedule        = "rate(1 minute)"
schedule_name   = "schedule-1"
schedule_group  = "default"
iam_policy_name = "eb-lambda-policy"