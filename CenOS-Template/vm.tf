resource "vsphere_virtual_machine" "os-master" {
  count                       = 3
  name                        = "${var.machine-prefix[terraform.workspace]}-master-${count.index}"
  resource_pool_id            = "${data.vsphere_resource_pool.pool.id}"
  datastore_id                = "${data.vsphere_datastore.datastore.id}"
  folder                      = "stobias"
  num_cpus                    = 2
  memory                      = 16000
  guest_id                    = "${data.vsphere_virtual_machine.atomic-template.guest_id}"
  scsi_type                   = "${data.vsphere_virtual_machine.atomic-template.scsi_type}"
  wait_for_guest_net_routable = false

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.atomic-template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "150"
    eagerly_scrub    = "${data.vsphere_virtual_machine.atomic-template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.atomic-template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.atomic-template.id}"

    customize {
      linux_options {
        host_name = "${var.machine-prefix[terraform.workspace]}-master-${count.index}"
        domain    = "red8coe.com"
      }

      network_interface {}

      dns_server_list = ["10.90.38.250"]
      ipv4_gateway    = "10.90.61.1"
    }
  }

  provisioner "remote-exec" {
    script = "scripts/disk_setup.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "${var.ssh_password}"
    }
  }
}

resource "vsphere_virtual_machine" "os-infra" {
  count                       = 2
  name                        = "${var.machine-prefix[terraform.workspace]}-infra-${count.index}"
  resource_pool_id            = "${data.vsphere_resource_pool.pool.id}"
  datastore_id                = "${data.vsphere_datastore.datastore.id}"
  folder                      = "stobias"
  num_cpus                    = 2
  memory                      = 8196
  guest_id                    = "${data.vsphere_virtual_machine.atomic-template.guest_id}"
  scsi_type                   = "${data.vsphere_virtual_machine.atomic-template.scsi_type}"
  wait_for_guest_net_routable = false

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.atomic-template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "150"
    eagerly_scrub    = "${data.vsphere_virtual_machine.atomic-template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.atomic-template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.atomic-template.id}"

    customize {
      linux_options {
        host_name = "${var.machine-prefix[terraform.workspace]}-infra-${count.index}"
        domain    = "red8coe.com"
      }

      network_interface {}

      dns_server_list = ["10.90.38.250"]
      ipv4_gateway    = "10.90.61.1"
    }
  }

  provisioner "remote-exec" {
    script = "scripts/disk_setup.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "${var.ssh_password}"
    }
  }
}

resource "vsphere_virtual_machine" "os-app-node" {
  count                       = 3
  name                        = "${var.machine-prefix[terraform.workspace]}-node-${count.index}"
  resource_pool_id            = "${data.vsphere_resource_pool.pool.id}"
  datastore_id                = "${data.vsphere_datastore.datastore.id}"
  folder                      = "stobias"
  num_cpus                    = 2
  memory                      = 8196
  guest_id                    = "${data.vsphere_virtual_machine.atomic-template.guest_id}"
  scsi_type                   = "${data.vsphere_virtual_machine.atomic-template.scsi_type}"
  wait_for_guest_net_routable = false

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.atomic-template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "150"
    eagerly_scrub    = "${data.vsphere_virtual_machine.atomic-template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.atomic-template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.atomic-template.id}"

    customize {
      linux_options {
        host_name = "${var.machine-prefix[terraform.workspace]}-node-${count.index}"
        domain    = "red8coe.com"
      }

      network_interface {}

      dns_server_list = ["10.90.38.250"]
      ipv4_gateway    = "10.90.61.1"
    }
  }

  provisioner "remote-exec" {
    script = "scripts/disk_setup.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "${var.ssh_password}"
    }
  }
}

resource "vsphere_virtual_machine" "os-lb" {
  count                       = 1
  name                        = "${var.machine-prefix[terraform.workspace]}-lb-${count.index}"
  resource_pool_id            = "${data.vsphere_resource_pool.pool.id}"
  datastore_id                = "${data.vsphere_datastore.datastore.id}"
  folder                      = "stobias"
  num_cpus                    = 2
  memory                      = 8196
  guest_id                    = "${data.vsphere_virtual_machine.atomic-template.guest_id}"
  scsi_type                   = "${data.vsphere_virtual_machine.atomic-template.scsi_type}"
  wait_for_guest_net_routable = false

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.atomic-template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "150"
    eagerly_scrub    = "${data.vsphere_virtual_machine.atomic-template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.atomic-template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.atomic-template.id}"

    customize {
      linux_options {
        host_name = "${var.machine-prefix[terraform.workspace]}-node-${count.index}"
        domain    = "red8coe.com"
      }

      network_interface {}

      dns_server_list = ["10.90.38.250"]
      ipv4_gateway    = "10.90.61.1"
    }
  }

  provisioner "remote-exec" {
    script = "scripts/disk_setup.sh"

    connection {
      type     = "ssh"
      user     = "root"
      password = "${var.ssh_password}"
    }
  }
}

/*
* Create Kubespray Inventory File
*
*/
data "template_file" "inventory" {
  template = "${file("${path.module}/templates/inventory.tpl")}"

  vars {
    list_infra  = "${join(format(".red8coe.com %v", "openshift_node_labels=\"{'region': 'primary', 'zone': 'west'}\"\n"), vsphere_virtual_machine.os-infra.*.name)}"
    list_master = "${join(format(".red8coe.com %v", "openshift_node_labels=\"{'region': 'primary', 'zone': 'west'}\"\n"), vsphere_virtual_machine.os-master.*.name)}"
    list_node   = "${join(format(".red8coe.com %v", "openshift_node_labels=\"{'region': 'primary', 'zone': 'west'}\"\n"), vsphere_virtual_machine.os-app-node.*.name)}"
    list_lb     = "${join(format(".red8coe.com %v", "openshift_node_labels=\"{'region': 'primary', 'zone': 'west'}\"\n"), vsphere_virtual_machine.os-lb.*.name)}"
  }
}

resource "null_resource" "inventories" {
  provisioner "local-exec" {
    command = "echo '${data.template_file.inventory.rendered}' > ./hosts"
  }

  triggers {
    template = "${data.template_file.inventory.rendered}"
  }
}
