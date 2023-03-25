resource "google_compute_network" "vpc_network" {
  name                    = "project-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "web-subnet-1" {
  name          = "web-subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "web-subnet-2" {
  name          = "web-subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "app-subnet-1" {
  name          = "app-subnet-1"
  ip_cidr_range = "10.0.10.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "app-subnet-2" {
  name          = "app-subnet-2"
  ip_cidr_range = "10.0.11.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "data-subnet-1" {
  name          = "data-subnet-1"
  ip_cidr_range = "10.0.20.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "data-subnet-2" {
  name          = "data-subnet-2"
  ip_cidr_range = "10.0.21.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
  private_ip_google_access = true
}

resource "google_compute_firewall" "web_firewall" {
  name    = "web-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  target_tags = ["app"]
}

resource "google_compute_firewall" "app_firewall" {
  name    = "app-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_tags = ["app"]
  target_tags = ["db"]
}

resource "google_compute_firewall" "db_firewall" {
  name    = "db-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  source_tags = ["app"]
  target_tags = ["db"]
}

resource "google_service_networking_connection" "private_service_connection" {
  network                 = google_compute_network.vpc_network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["10.0.10.0/24", "10.0.11.0/24", "10.0.20.0/24", "10.0.21/24"]
}