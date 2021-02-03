locals {
  map = var.resource_configuration_metadata["dynamodb"]["main_table"]
}

output "resource_object" {
  value = local.map["iops"]["read_capacity"]
}