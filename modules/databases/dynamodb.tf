module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"
  version  = "4.1.0"

  name     = "ToggleMasterAnalytics"
  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}