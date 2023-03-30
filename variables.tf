variable "TF_VAR_datadog_api_key" {
  type      = string
  sensitive = true
}

variable "TF_VAR_datadog_app_key" {
  type      = string
  sensitive = true
}

variable "datadog_api_url" {
  type = string
}