locals {
  main_table = var.resource_configuration_metadata["dynamodb"]["main_table"]
}

resource aws_dynamodb_table "recipes_main_table" {
  hash_key = "UUID"
  range_key = "Service"
  name = local.main_table["description"]["name"]
  read_capacity = local.main_table["iops"]["read_capacity"]
  write_capacity = local.main_table["iops"]["write_capacity"]

  dynamic "attribute" {
    for_each = local.main_table["attributes"]
    content {
      name = attribute.key
      type = attribute.value
    }
  }
}