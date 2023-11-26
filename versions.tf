terraform {
  required_version = ">= 1.3.0"
  cloud {
    organization = "cklewar"
    hostname     = "app.terraform.io"

    workspaces {
      name = "f5-xc-ipsec-module"
    }
  }
  
  required_providers {
    local = ">= 2.2.3"
    null = ">= 3.1.1"
    volterra = {
      source = "volterraedge/volterra"
      version = "= 0.11.24"
    }
  }
}