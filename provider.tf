terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

provider "datadog" {
  api_key = var.TF_VAR_datadog_api_key
  app_key = var.TF_VAR_datadog_app_key
  api_url = var.datadog_api_url
}