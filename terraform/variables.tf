variable "do_region" {
  type    = string
  default = "sfo3"
}

# app expects a slightly different slug
variable "do_app_region" {
  type    = string
  default = "sfo"
}

variable "do_token" {
  description = "Digital Ocean token"
  type        = string
  sensitive   = true
}

variable "jump_server_ssh_key_path" {
  description = "Path to the public SSH key used to access the Jump Server"
  type        = string
  default     = "~/.ssh/id_rsa_do"
}

variable "jump_server_volume_name" {
  type    = string
  default = "cas-jump-server-volume"
}

variable "postmark_apikey" {
  description = "Postmark Apikey"
  type        = string
  sensitive   = true
}
