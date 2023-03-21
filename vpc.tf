resource "google_compute_network" "vpc_network" {
  name                    = "project-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-1" {
  name          = "subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet-2" {
  name          = "subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet-3" {
  name          = "subnet-3"
  ip_cidr_range = "10.0.3.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet-4" {
  name          = "subnet-4"
  ip_cidr_range = "10.0.4.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet-5" {
  name          = "subnet-5"
  ip_cidr_range = "10.0.5.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "subnet-6" {
  name          = "subnet-6"
  ip_cidr_range = "10.0.6.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
}