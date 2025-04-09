###vm_web

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex_compute_instance name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_instance platform_id"
}

#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "yandex_compute_instance resources cores"
#}

#variable "vm_web_memory" {
#  type        = number
#  default     = 1
#  description = "yandex_compute_instance resources memory"
#}

#variable "vm_web_core_fraction" {
#  type        = number
#  default     = 20
#  description = "yandex_compute_instance resources core_fraction"
#}

#vm_db

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image family"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "yandex_compute_instance name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_instance platform_id"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

#variable "vm_db_cores" {
#  type        = number
#  default     = 2
#  description = "yandex_compute_instance resources cores"
#}

#variable "vm_db_memory" {
#  type        = number
#  default     = 2
#  description = "yandex_compute_instance resources memory"
#}

#variable "vm_db_core_fraction" {
#  type        = number
#  default     = 20
#  description = "yandex_compute_instance resources core_fraction"
#}

variable "vms_resources" {
  type        = map(map(number))
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 20
      }
    vm_db_resources = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      }
    }
}

variable "vm_metadata" {
  type        = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ9XWIDiVK9Ueqf4hIJWNTBFtGIYQkOraHBmhyt6JpPr root@U4G"
  }
}
