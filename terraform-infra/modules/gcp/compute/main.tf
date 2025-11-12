resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    access_config {
      // Ephemeral IP
    }
  }

  metadata = var.metadata

  service_account {
    email  = var.service_account_email
    scopes = var.scopes
  }
}

resource "google_compute_firewall" "default" {
  name    = "${var.instance_name}-firewall"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }

  source_ranges = var.source_ranges
}