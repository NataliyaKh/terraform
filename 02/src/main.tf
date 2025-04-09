resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
 #"ubuntu-2004-lts"
}

resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
#"netology-develop-platform-web"
  platform_id = var.vm_web_platform_id
#"standard-v3"
 # resources {
   # cores         = var.vm_web_cores
#2
   # memory        = var.vm_web_memory
#1
   # core_fraction = var.vm_web_core_fraction
#20
 # }
  resources   {
   cores         = var.vms_resources.vm_web_resources.cores
   memory        = var.vms_resources.vm_web_resources.memory
   core_fraction = var.vms_resources.vm_web_resources.core_fraction
 }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_metadata.serial-port-enable
    ssh-keys           = var.vm_metadata.ssh-keys
  }

}

resource "yandex_vpc_subnet" "develop1" {
  name           = var.vm_db_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

resource "yandex_compute_instance" "platform1" {
  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_default_zone
  resources   { 
   cores         = var.vms_resources.vm_db_resources.cores  
   memory        = var.vms_resources.vm_db_resources.memory
   core_fraction = var.vms_resources.vm_db_resources.core_fraction
 }  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop1.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_metadata.serial-port-enable
    ssh-keys           = var.vm_metadata.ssh-keys
  }

}
