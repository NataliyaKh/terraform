resource "local_file" "inventory" {
    depends_on = [yandex_compute_instance.web, yandex_compute_instance.for_each, yandex_compute_instance.storage]
    filename = "./hosts.yml"
    content = templatefile("./inventory.tftpl", 
       {
        webservers = yandex_compute_instance.web,
        databases = yandex_compute_instance.for_each,
        storage = yandex_compute_instance.storage
       })
}
