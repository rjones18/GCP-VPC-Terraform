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
}

resource "google_compute_subnetwork" "app-subnet-2" {
  name          = "app-subnet-2"
  ip_cidr_range = "10.0.11.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "data-subnet-1" {
  name          = "data-subnet-1"
  ip_cidr_range = "10.0.20.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "data-subnet-2" {
  name          = "data-subnet-2"
  ip_cidr_range = "10.0.21.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}