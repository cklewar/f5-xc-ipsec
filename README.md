# F5-XC-IPSEC
This repository consists of Terraform templates to create F5XC IPSec object.

## Usage

- Clone this repo with: `git clone --recurse-submodules https://github.com/cklewar/f5-xc-ipsec`
- Enter repository directory with: `cd f5-xc-ipsec`
- Obtain F5XC API certificate file from Console and save it to `cert` directory
- Pick and choose from below examples and add mandatory input data and copy data into file `main.tf.example`.
- Rename file __main.tf.example__ to __main.tf__ with: `rename main.tf.example main.tf`
- Initialize with: `terraform init`
- Apply with: `terraform apply -auto-approve` or destroy with: `terraform destroy -auto-approve`

## Multi Node Single NIC and new subnet module usage example

````hcl
variable "project_prefix" {
  type        = string
  description = "prefix string put in front of string"
  default     = "f5xc"
}

variable "project_suffix" {
  type        = string
  description = "prefix string put at the end of string"
  default     = "01"
}

variable "f5xc_api_p12_file" {
  type = string
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_tenant" {
  type = string
}

module "tunnel" {
  source                        = "./modules/f5xc/tunnel"
  f5xc_tenant                   = var.f5xc_tenant
  f5xc_namespace                = "system"
  f5xc_api_p12_file             = var.f5xc_api_p12_file
  f5xc_api_token                = var.f5xc_api_token
  f5xc_api_url                  = var.f5xc_api_url
  f5xc_tunnel_name              = format("%s-tunnel-%s", var.project_prefix, var.project_suffix)
  f5xc_tunnel_clear_secret      = "sharedSecret"
  f5xc_tunnel_remote_ip_address = "8.8.8.8"
}
```
