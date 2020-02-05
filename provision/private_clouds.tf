resource "google_compute_network" "development_vpc" {
    name = "development-vpc"
    description = "Private cloud hosting all resources related to development of trading models. ${var.GCP_REGION} region"
    routing_mode = "GLOBAL"
    project = var.GCP_PROJECT
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "development_public_subnet" {
    name = "development-public-subnet-${var.GCP_REGION}"
    description = "public subnetwork. ${var.GCP_REGION} region"
    ip_cidr_range = var.development_region_public_cidr_range[var.GCP_REGION]
    region = var.GCP_REGION
    network = google_compute_network.development_vpc.self_link
}

resource "google_compute_subnetwork" "development_private_subnet" {
    name = "development-private-subnet-${var.GCP_REGION}"
    description = "private subnetwork. ${var.GCP_REGION} region"
    ip_cidr_range = var.development_region_private_cidr_range[var.GCP_REGION]
    region = var.GCP_REGION
    network = google_compute_network.development_vpc.self_link
}

resource "google_compute_firewall" "development_firewall_internal" {
    name = "development-vpc-firewall-internal"
    network = google_compute_network.development_vpc.name
    allow {
        protocol = "tcp"
    }
    allow {
        protocol = "udp"
    }
    allow {
        protocol = "icmp"
    }
    source_ranges = [var.development_region_public_cidr_range[var.GCP_REGION]]
}

resource "google_compute_firewall" "development_firewall_external" {
    name = "development-vpc-firewall-external"
    network = google_compute_network.development_vpc.name
    allow {
        protocol = "tcp"
        ports = ["22", "6443"]
    }
    allow {
        protocol = "icmp"
    }
    source_ranges = ["0.0.0.0/0"]
}