terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.70.0"
    }
  }
}

provider "google" {
  project = "spry-ivy-280511"
  region = "us-central1"
}

resource "google_compute_network" "my-vpc" {
  name         = "myvpc"
  project      = "spry-ivy-280511"  
    
}

resource "google_compute_subnetwork" "my-vpcsubnet" {
  network      = google_compute_network.my-vpc.name
  name         = "myvpcsubnet"
  project      = "spry-ivy-280511"  
  ip_cidr_range  = "10.0.0.0/24"
    
}

resource "google_compute_instance" "my-instance" {
  name         = "my-instance"
  machine_type = "n1-standard-2"
  zone         = "us-central1-c"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
  subnetwork = google_compute_subnetwork.my-vpcsubnet.name
    access_config {
    }
  }
}