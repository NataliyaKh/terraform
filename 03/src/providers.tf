terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = "b1gb4n5oop4thmmubnlh"
  folder_id                = "b1gnrgrrnoj95l4hbt8j"
  service_account_key_file = file("/home/vboxuser/authorized_key.json")
  zone                     = "ru-central1-a" #(Optional) 
}
