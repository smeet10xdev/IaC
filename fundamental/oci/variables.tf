locals {
  envs = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => sensitive(tuple[1]) }
}
output "envs" { value = envs }

variable "tenancy_id" {
  type = string
}

variable "user_id" {
  type = string
}

variable "api_fingerprint" {
  type = string
}

variable "api_private_key_path" {
  type = string
}

variable "region" {
  type = string
}

variable "compartment_id" {
  type = string
}