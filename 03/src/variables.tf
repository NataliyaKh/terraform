###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "disks_resources" {
    type    = object({
        disk_type = string
        disk_size = number
    })
    default = {
        disk_type="network-hdd"
        disk_size=1
    }
    description = "VMs resources"
}

variable "vms_name" {
  type = string
  default = "web"
  description = "VMs names"
}

variable "vms_name_storage" {
  type = string
  default = "storage"
  description = "VMs names"
}

variable "vms_resources" {
    type    = object({
        platform_id = string
        cores   =   number
        memory  =   number
        core_fraction   =   number
        disk_type = string
        disk_size = number
        preemptible = bool
        nat = bool
    })
    default = {
        platform_id="standard-v1"
        cores=2
        memory=1
        core_fraction=20
        disk_type="network-ssd"
        disk_size=1
        preemptible=true
        nat=true
    }
    description = "VMs resources"
}
