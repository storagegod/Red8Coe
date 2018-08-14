terraform {
  required_version = ">= 0.10.7"
}

provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server[terraform.workspace]}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

provider "windows-dns" {
  server_name = "dc01.red8coe.com"
  username    = "${var.vsphere_user}"
  password    = "${var.vsphere_password}"
}
